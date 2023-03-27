class MatchesController < ApplicationController

  def show
    @match = Match.find(params[:id])
    @teams = Team.all
  end

end
