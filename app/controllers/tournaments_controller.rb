class TournamentsController < ApplicationController
  before_action :set_params, only: %i[join show edit update launch]

  def join
    @tournament = Tournament.find(params[:id])
    if current_user.user_tournaments.include?(@tournament)
      flash[:alert] = "Vous êtes déjà inscrit à ce tournoi"
    else
      @tournament.users << current_user
      flash[:notice] = "Vous êtes bien inscrit à ce tournoi"
    end
    redirect_to tournament_path(@tournament)
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
    UserTournament.create(tournament: @tournament, user: current_user)
    if @tournament.save
      redirect_to tournament_path(@tournament)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @team = Team.where(user: current_user, tournament: @tournament).first
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

    @tournament.status = "launched"
    @tournament.save!

    # on définit la taille des effectifs de chaque équipe
    team_size = (Politic.count / @tournament.users.count)

    # on place toutes les polics de la BDD dans un ordre aléatoire
    politics = Politic.all.shuffle

    # Tirage au sort des effectif de chaque équipe
    @tournament.teams.each do |team|
      team_size.times do
        politic = politics.pop
        TeamPolitic.create!(team_id: team, politic_id: politic)
      end
    end

    flash[:notice] = "Le tournoi est lancé, vous pouvez désormais créer votre équipe"
    redirect_to tournament_path(@tournament)
  end

  private

  def tournament_params
    params.require(:tournament).permit(:name, :status, :final_result)
  end

  def set_params
    @tournament = Tournament.find(params[:id])
  end

end
