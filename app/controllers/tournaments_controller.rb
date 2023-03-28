class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.user = current_user
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
