require "open-uri"
require "nokogiri"
require "date"

class MatchesController < ApplicationController
  def index
    @team = Team.where(tournament: params[:tournament_id], user: current_user).first
    @tournament = @team.tournament
    @matches = @team.matches.sort_by(&:date)
    @matches.each do |match|
      change_status(match)
    end
    @matches_composition = @matches.select{|match| match.statut == "Composition"}
    @matches_in_progress = @matches.select{|match| match.statut == "In progress"}
    @matches_closed = @matches.select{|match| match.statut == "Closed"}
  end

  def new
    @match = Match.new
    @teams = Team.all
  end

  def create
    @match = Match.new(match_params)
    @match = Team.find(params[:team_id])
    if @match.save
      redirect_to match_path(@match)
    else
      render :new
    end
  end

  def show
    @match = Match.find(params[:id])
    @tournament = @match.tournament
    @line_up = @match.line_ups
    # update_results
  end

  def update_results(match=nil)
    # @match = Match.find(params[:id])
    redirection_at_end = true unless match
    match = Match.find(params[:id]) unless match
    @line_up = match.line_ups
    @line_up.each do |line_up|
      result = 0
      page = 0
      correctif = 0

      # Tant que le score est un multiple de 10 on va à la page suivante (car il
      # y a 10 résultats par page, donc ça veut dire qu'on a marqué le max de points
      # pour les pages regardées et qu'il y a encore potentiellement d'autres pages
      # à aller chercher).
      while ((result + correctif) % 10).zero?
        page += 1
        fetch_data(line_up.politic.last_name, page)
        result += @score
        # le correctif correspond aux articles parus hier quand on est lundi. Le prendre
        # en compte dans la condition du while permet de s'arrêter au bon moment
        correctif += @sunday_yesterday
        # si score de cette page = 0 : on arrête d'itérer (pour éviter d'itérer
        # sans fin si on est bloqué sur un multiple de 10)
        break if @score.zero?
      end
      line_up.result = result
      line_up.save
    end
    redirect_to request.referrer if redirection_at_end
  end

  private

  MONTHS_ABBR_TO_NUM = {
    'janv.' => 1,
    'févr.' => 2,
    'mars' => 3,
    'avr.' => 4,
    'mai' => 5,
    'juin' => 6,
    'juil.' => 7,
    'août' => 8,
    'sept.' => 9,
    'oct.' => 10,
    'nov.' => 11,
    'déc.' => 12
  }

  def match_params
    params.require(:match).permit(:team_id)
  end

  def fetch_data(politic, i)
    @score = 0
    @sunday_yesterday = 0
    # on définit les 2 bornes entre lesquelles on compte les points
    today = Date.today
    last_monday = today - (today.wday - 1)
    # on va chercher les dates affichées sur la page n° i
    politic = CGI.escape(politic)
    @url = "https://www.dna.fr/recherche?q=#{politic}&x=1&y=5&x=1&y=1&page=#{i}"
    html_file = URI.open(@url).read
    @html_doc = Nokogiri::HTML.parse(html_file)
    @html_doc.search(".publish").each do |date_string|
      # on décompose la date pour vérifier sa validité
      date_string_with_num_month = date_string.text.strip.gsub(/#{MONTHS_ABBR_TO_NUM.keys.join('|')}/, MONTHS_ABBR_TO_NUM)
      date_components = date_string_with_num_month.split(' ')
      day = date_components[0].to_i
      month = date_components[1].to_i
      year = date_components[2].to_i
      # si la date est valide elle marque 1 point si elle comprise entre les 2 bornes
      if Date.valid_date?(year, month, day)
        date = Date.new(year, month, day)
        @score += 1 if date.between?(last_monday, today)
      # si la date n'est pas valide cela signifie qu'elle est de type "10h" ou "hier",
      # ça marque donc un point aussi (sauf si on est lundi et que la date est "Hier")
      elsif today.wday != 1 || !date_string.text.strip.include?("Hier")
        @score += 1
      elsif today.wday == 1 && date_string.text.strip.include?("Hier")
      # ce correctif (correspondant aux articles marqués "hier" quand on est lundi
      # aide la méthode update_results à savoir s'il faut continuer d'aller chercher
      # les pages suivantes
        @sunday_yesterday += 1
      end
    end
  end

  def match_score_count(match)
    @my_match_score = 0
    @match_score_adversary = 0
    # calcul du match_score par équipe
    line_ups = LineUp.where(match_id: match.id)
    match.teams.each do |team|
      if team.user == current_user
        line_ups.each do |line_up|
          @my_match_score += line_up.result if team.politics.include?(line_up.politic) && team.user == current_user
        end
      elsif team.user != current_user
        line_ups.each do |line_up|
          @match_score_adversary += line_up.result if team.politics.include?(line_up.politic) && team.user != current_user
        end
      end
      # Sauvegarde du match_score dans la db
      match.team_matches.each do |team_match|
        if team_match.team.user == current_user
          team_match.match_score = @my_match_score
        else
          team_match.match_score = @match_score_adversary
        end
        team_match.save
      end
      match.team_matches.sort.reverse
      match.winner = match.team_matches[0].team.name
      match.save
    end
  end

  def change_status(match)
    if Date.today > match.date && Date.today < (match.date + 7)
      match.statut = "In progress"
      match.save
    elsif Date.today > (match.date + 7) && match.statut != "Closed"
      match.statut = "Closed"
      update_results(match)
      match_score_count(match)
      match.team_matches.sort_by(&:match_score)
      match.winner = match.team_matches[0].team.name
      match.save
    end
  end
end
