class TeamsController < ApplicationController
  def new
    @team = Team.new
  end
  def create
    @team = Team.new(params[:team])
    if @team.save
      flash[:notice] = "Team created successfully."
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
end
