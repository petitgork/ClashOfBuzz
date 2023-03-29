class MatchesController < ApplicationController

  def show
    @match = Match.find(params[:id])
    @tournament = @match.tournament
    @match.teams.each do |team|
      @adversary_user = team.user if team.user != current_user
    end
    @team_current_user = Team.where(user: current_user, tournament: @tournament).first
    @team_adversary_user = Team.where(user: @adversary_user, tournament: @tournament).first
  end

end
