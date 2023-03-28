class TournamentsController < ApplicationController
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
    if @tournament.save
      redirect_to tournament_path(@tournament)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update(tournament_params)
      redirect_to tournament_path(@tournament)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def tournament_params
    params.require(:tournament).permit(:name, :status, :final_result)
  end
end
