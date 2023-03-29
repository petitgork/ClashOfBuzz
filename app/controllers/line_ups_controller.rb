class LineUpsController < ApplicationController
  def new
    @line_up = LineUp.new
    @user = current_user
    @tournament = Tournament.find(params[:tournament_id])
  end

  def create
    # création de l'équipe
    line_up = LineUp.new(line_up_params)
    line_up.user = current_user
    tournament = Tournament.find(params[:tournament_id])
    line_up.tournament = tournament

    # selection des joueurs
    @line_up = LineUp.where[:politics].first
    line_up.each do
      line = Politic.find(line_up.politic_id)
      line_up.politics << line
    end
    # condition de choix d'un joueur







      if line_up.politics.count == 5 && line_up.save
        flash[:notice] = "Votre équipe est prête."
        redirect_to user_path(current_user)
      else
        render ender :new, status: :unprocessable_entity
      end
    end
  end

  private

  def line_up_params
    params.require(:line_up).permit(:name, :avatar)
  end
end
