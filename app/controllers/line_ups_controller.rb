class LineUpsController < ApplicationController
  def create
    # création de l'équipe
    line_up = LineUp.new
    line_up.match = Match.find(params[:match_id])
    line_up.politic = Politic.find(params[:politic_id])
    if line_up.save
      flash[:notice] = "Votre équipe est prête."
      redirect_to match_path(line_up.match)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
