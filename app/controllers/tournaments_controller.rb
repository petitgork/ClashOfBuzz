require "date"

class TournamentsController < ApplicationController
  before_action :set_params, only: %i[join show edit update launch bids_validate]

  def join
    @tournament = Tournament.find(params[:id])
    if current_user.tournaments.include?(@tournament)
      flash[:alert] = "Tu es deja inscrit a ce tournoi"
    else
      redirect_to new_tournament_team_path(@tournament)
    end
  end

  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.status = "created"
    if @tournament.save
      redirect_to new_tournament_team_path(@tournament)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tournament = Tournament.find(params[:id])
    @team = Team.where(user: current_user, tournament: @tournament).first

    # on définit les politiques disponibles comme ceux pour lesquels il n'existe pas de team_politics liés à une équipe de ce tournoi et ayant le champ acquired true
    @available_politics = Politic.where.not(
      id: TeamPolitic
            .joins(:team)
            .where(teams: { tournament_id: @tournament.id }, acquired: true)
            .select(:politic_id)
    )
    if @team
      @acquired_politics = @team.team_politics.select do |team_politic|
        team_politic.acquired
      end
    end
    @team_politic = TeamPolitic.new

    @matches = @tournament.matches

    if @team && @team.politics.count.positive?
      @politics_slice_a = @team.politics.slice(0, 4)
      @politics_slice_b = @team.politics.slice(4, 4)
      @politics_slice_c = @team.politics.slice(8, 4)
      @politics_slice_d = @team.politics.slice(12, 4)
    end

    tournament_results(@tournament)

    # affichage du calendrier
    dates = []
    @matches.each do |match|
      dates << match.date unless dates.include?(match.date)
    end
    @begin = dates.min
    @end = dates.max
    @next_date = dates.find do |date|
      date > Date.today
    end

    # match en cours
    if @team
      @current_match = @team.matches.find do |match|
        match.statut == "In progress"
      end
    end
  end

  def edit
  end

  def update
    if @tournament.update(tournament_params)
      redirect_to tournament_path(@tournament)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def launch
    # quand on lance le tournoi toutes les équipes ont déjà été créées, mais aucun effectif
    # ne leur a encore été attribué

    # on vérifie que le nombre d'équipes est pair
    if @tournament.teams.count.odd?
      flash[:alert] = "Le nombre d'équipes doit être pair"
      redirect_to tournament_path(@tournament)
      return
    end

    # statut de l'équipe passe à "mercatos"
    @tournament.status = "mercato"
    @tournament.save!

    # tout ce qui suit : correspond à la version sans mercato, avec tirage au sort des effectifs
    # # on définit la taille des effectifs de chaque équipe
    # team_size = (Politic.count / @tournament.teams.count)

    # # on mélange tous les politics de la BDD dans un array aléatoire
    # politics = Politic.all.shuffle

    # # Tirage au sort des effectif de chaque équipe
    # @tournament.teams.each do |team|
    #   team_size.times do
    #     politic = politics.pop
    #     TeamPolitic.create!(team: team, politic: politic)
    #   end
    # end

    # On génère le "calendrier" et les dates de des rencontres
    calendar(@tournament)

    # On part sur la page show du tournoi
    flash[:notice] = "Le tournoi est lance, preparez vos equipes"
    redirect_to tournament_path(@tournament)
  end

  def bids_validate
    @team = Team.where(user: current_user, tournament: @tournament).first
    @team.bids_closed = true
    @team.save
    if everybody_validated(@tournament)
      end_of_round(@tournament)
    end
    redirect_to tournament_path(@tournament)
  end

  def ranking_details
    @tournament = Tournament.find(params[:id])
    @team = Team.where(user: current_user, tournament: @tournament).first
    @matches = @tournament.matches

  end


  private

  def everybody_validated(tournament)
    # si l'ensemble des équipes du tournois ont validé leurs enchères, on return true
    tournament.teams.each do |team|
      return false unless team.bids_closed
    end
    return true
  end

  def end_of_round(tournament)
    # on fait un array avec tous les team_politics de toutes les équipes du tournoi
    team_politics = []
    tournament.teams.each do |team|
      team_politics << team.team_politics
    end
    # on regroupe les team_politics par politique
    team_politics_by_politic = team_politics.flatten.group_by(&:politic_id)
    # on trie les team_politics de chaque politique par enchère décroissante
    team_politics_by_politic.each do |politic_id, team_politics|
      team_politics.sort_by!(&:bid_amount).reverse!
    end
    # pour chaque politique on garde la meilleure enchère et on supprime les autres
    team_politics_by_politic.each do |politic_id, team_politics|
      team_politics.each_with_index do |team_politic, index|
        if index.positive?
          team_politic.destroy
        else
          team_politic.acquired = true
          team_politic.save
        end
      end
    end
    # on passe toutes les team du tournoi en bids_closed = false
    tournament.teams.each do |team|
      team.bids_closed = false
      team.save
    end

    # si toutes les team du tournoi ont chacune au moins 10 team_politics, on passe le statut du tournoi à "in progress"
    tournament.status = "in progress"
    tournament.teams.each do |team|
      tournament.status = "mercato" if team.team_politics.count < 10
    end
    tournament.save
  end

  def tournament_results(tournament)
    tournament = Tournament.find(params[:id])
    team_matches = tournament.team_matches
    teams = tournament.teams
    matches = tournament.matches

    teams.each do |team|
      all_matches = team.team_matches
      team.score = 0
	    all_matches.each do |all_match|

        if team_matches.include?(all_match)
        team.score += all_match.match_score
        team.save
        end
      end
	  end
  end



  # def tournament_results(tournament)
  #   # on récupère le tournoi
  #   tournament = Tournament.find(params[:id])
  #   team_matches = tournament.team_matches
  #   # on récupère les équipes du tournoi
  #   teams = tournament.teams
  #   # on récupère les matchs du tournoi
  #   matches = tournament.matches
  #   # recuperer tous matchs de chaque teams (peut importe le tournois)
  #   teams.each do |team|
  #     all_matches = team.team_matches.pluck(:id)
  #   # recuperer tous les matchs du tournoi et de l'équipe
  #     # all_matches_of_tournament = TeamMatch.joins(:teams).where(tournament: tournament).where(team_id: team.id)


  #   # recuperer les matchs score pour les ajouter au score de la team
  #     all_matches_of_tournament.each do |match|
  #       team.score += match.match_score
  #       team.score.save
  #     end
  #   end
  # end

  def tournament_params
    params.require(:tournament).permit(:name, :status, :final_result, :photo)
  end

  def set_params
    @tournament = Tournament.find(params[:id])
  end

  def calendar(tournament)
    teams = tournament.teams.all.shuffle
    (0...teams.size-1).each do |i|
      (i+1...teams.size).each do |j|
        match = Match.create!(tournament: tournament)
        TeamMatch.create!(match: match, team: teams[i])
        TeamMatch.create!(match: match, team: teams[j])
      end
    end
    # on calcule la durée du tournoi
    weeks_count = teams.count - 1
    # on définit le début du tournoi à lundi prochain
    lundi = Date.parse("monday")
    delta = lundi > Date.today ? 0 : 7
    tournament_begin = lundi + delta
    tournament_dates = [tournament_begin]
    # on définit toutes les dates suivantes (j'ajoute un +5 car je ne suis pas la
    # logique round robin) et c'est pas optimisé
    while tournament_dates.count < (weeks_count + 5)
      tournament_dates << (tournament_dates.last + 7)
    end
    # on associe les dates aux matchs
    tournament.matches.each do |match|
      tournament_dates.each do |date|
        similar_matches = Match.joins(:team_matches)
                               .where(tournament: tournament, date: date)
                               .where("team_matches.team_id IN (?)", match.team_ids)
        match.date = date if similar_matches.empty?
        match.save!
        break if match.date
      end
    end
  end
end
