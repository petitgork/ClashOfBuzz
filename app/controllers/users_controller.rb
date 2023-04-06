class UsersController < ApplicationController
  def show
    @user = current_user
    @teams = Team.where(user_id: current_user)
    @teams.each do |team|
      @politic = team.politics.sample
    end
  end
end
