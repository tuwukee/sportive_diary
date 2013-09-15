class CoachesController < ApplicationController
  before_filter :coach_required

  def index
  end

  def manage_teams
    @players = current_user.players
    @teams = current_user.teams
  end

  private

  def coach_required
  	unless current_user
  	  flash[:alert] = "You need to sign in or to sign up"
  	  redirect_to root_path
  	else if !current_user.coach?
        flash[:alert] = "You have to be a coach to have the rights to visit this page"
        redirect_to root_path
      end
    end
  end
end
