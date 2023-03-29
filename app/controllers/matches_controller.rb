class MatchesController < ApplicationController
  def index
    @team = Team.where(tournament: params[:tournament_id], user: current_user).first
    @matches = @team.matches
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
  end

  
  private

  def match_params
    params.require(:match).permit(:team_id)
  end

end
