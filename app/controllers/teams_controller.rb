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
    tournament = Tournament.find(params[:tournament.id])
    team.tournament = tournament
    team.number_of_politics = (Politic.count / tournament.users.count)

    if @team.save
      flash[:notice] = "Team created successfully."

      # Tirage au sort de l'équipe
      available_politics = Politic.all - tournament.teams.politics
      team.number_of_politics.times do
        politic = available_politics.sample(1)
        available_politics -= politic
        Team_politic.create!(team, politic)
      end

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
