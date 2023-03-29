class TeamsController < ApplicationController
  def show
    @team = Team.find(params[:id])
    @politics = @team.politics
  end

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
      redirect_to tournament_path(tournament)
    else
      render ender :new, status: :unprocessable_entity
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :avatar)
  end
end
