class MatchesController < ApplicationController
  def index
    @tournament = Tournament.find(params[:tournament_id])
    @matches = @tournament.matches
  end

  def show
    @match = Match.find(params[:id])
    @teams = Team.all
  end
end
