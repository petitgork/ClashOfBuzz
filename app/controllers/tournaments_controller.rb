class TournamentsController < ApplicationController
  def join
    @tournament = Tournament.find(params[:id])
    if current_user.tournaments.include?(@tournament)
      flash[:alert] = "Vous êtes déjà inscrit à ce tournoi"
    else
      @tournament.users << current_user
      flash[:notice] = "Vous êtes bien inscrit à ce tournoi"
    end
    redirect_to tournament_path(@tournament)
  end
end
