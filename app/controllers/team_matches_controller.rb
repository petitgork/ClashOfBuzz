class TeamMatchesController < ApplicationController
  def match_score_count
    @team_match = TeamMatch.find(params[:id])
    @my_match_score = 0
    @match_score_adversary = 0
    @match_id = @team_match.match_id

    line_ups = LineUp.where(match_id: @match_id)

    line_ups.each do |line_up|
      if @team_match.team.user == current_user
        @my_match_score += line_up.result
      else
        @match_score_adversary += line_up.result
      end
    end
  end
end
