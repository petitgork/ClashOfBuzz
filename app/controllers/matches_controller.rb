class MatchesController < ApplicationController
  def index
    @matches = Match.all
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
    @teams = Team.all
  end

  private

  def match_params
    params.require(:match).permit(:team_id)
  end
end
