class TeamPoliticsController < ApplicationController
  def new
    @team_politic = TeamPolitic.new
  end

  def create
    @team_politic = TeamPolitic.new(team_politic_params)
    @tournament = Tournament.find(params[:tournament_id])
    @team = Team.where(user: current_user, tournament: @tournament).first
    if @team_politic.save
      @team.wallet -= @team_politic.bid_amount
      @team.save
      redirect_to tournament_path(@team_politic.team.tournament)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @team_politic = TeamPolitic.find(params[:id])
    @tournament = Tournament.find(params[:tournament_id])
    @team = Team.where(user: current_user, tournament: @tournament).first
    @team.wallet += @team_politic.bid_amount
    if @team_politic.update(team_politic_params)
      @team.wallet -= @team_politic.bid_amount
      @team.save
      redirect_to tournament_path(@team_politic.team.tournament)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def team_politic_params
    params.require(:team_politic).permit(:team_id, :politic_id, :bid_amount)
  end

end
