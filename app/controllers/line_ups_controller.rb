class LineUpsController < ApplicationController
  def create
    # création de l'équipe
    if count_line_ups < 5
      line_up = LineUp.new
      line_up.match = Match.find(params[:match_id])
      line_up.politic = Politic.find(params[:politic_id])
      line_up.team = line_up.match.my_team_match(current_user).team
      if line_up.save
        flash[:notice] = "Ton equipe est prete." if count_line_ups == 5
        redirect_to match_path(line_up.match, anchor: "ta-selection")
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @line_up = LineUp.find(params[:id])
    @match = Match.where(id: @line_up.match_id).first
    @line_up.destroy
    redirect_to match_path(@match), status: :see_other
  end

  private

  def count_line_ups
    # récupération équipes du match
    match = Match.find(params[:match_id])
    match.line_ups.where(team_id: match.my_team_match(current_user).team).count
  end
end
