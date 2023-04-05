require "date"

class TournamentsController < ApplicationController
  before_action :set_params, only: %i[join show edit update launch]

  def join
    @tournament = Tournament.find(params[:id])
    if current_user.tournaments.include?(@tournament)
      flash[:alert] = "Vous êtes déjà inscrit à ce tournoi"
    else
      UserTournament.create(tournament: @tournament, user: current_user)
      flash[:notice] = "Vous êtes bien inscrit à ce tournoi"
    end
    redirect_to new_tournament_team_path(@tournament)
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
      UserTournament.create(tournament: @tournament, user: current_user)
      redirect_to new_tournament_team_path(@tournament)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @team = Team.where(user: current_user, tournament: @tournament).first
    @matches = @tournament.matches
    if @team && @team.politics.count.positive?
      @politics_slice_a = @team.politics.slice(0, 4)
      @politics_slice_b = @team.politics.slice(4, 4)
      @politics_slice_c = @team.politics.slice(8, 4)
      @politics_slice_d = @team.politics.slice(12, 4)
    end
    @tournament = Tournament.find(params[:id])
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

    # statut de l'équipe passe à "launched"
    @tournament.status = "launched"
    @tournament.save!

    # on définit la taille des effectifs de chaque équipe
    team_size = (Politic.count / @tournament.users.count)

    # on mélange tous les politics de la BDD dans un array aléatoire
    politics = Politic.all.shuffle

    # Tirage au sort des effectif de chaque équipe
    @tournament.teams.each do |team|
      team_size.times do
        politic = politics.pop
        TeamPolitic.create!(team: team, politic: politic)
      end
    end

    # On génère le "calendrier" et les dates de des rencontres
    calendar(@tournament)

    # On part sur la page show du tournoi
    flash[:notice] = "Le tournoi est lancé, découvrez vos équipes"
    redirect_to tournament_path(@tournament)
  end

  def ranking_details
    @tournament = Tournament.find(params[:id])
    @team = Team.where(user: current_user, tournament: @tournament).first
    @matches = @tournament.matches

  end


  private

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
