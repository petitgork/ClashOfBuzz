class TeamsController < ApplicationController
  def new
    @team = Team.new
    @user = current_user
    @tournament = Tournament.find(params[:tournament_id])
  end

  def create
    @team = Team.new(params[:team])
    @team.user_id = current_user.id
    if @team.save
      flash[:notice] = "Team created successfully."
      redirect_to _path
    else
      render ender :new, status: :unprocessable_entity
    end
  end
end
