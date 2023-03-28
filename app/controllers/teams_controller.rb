class TeamsController < ApplicationController
  def new
    @team = Team.new
    @user = current_user
    @tournament = Tournament.find(params[:tournament_id])
  end

  def create
    # création de l'équipe
    team = Team.new(team_params)
    team.user = current_user
    tournament = Tournament.find(params[:tournament_id])
    team.tournament = tournament
    if team.save
      flash[:notice] = "Team created successfully."
      redirect_to user_path(current_user)
    else
      render ender :new, status: :unprocessable_entity
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :avatar)
  end
end
