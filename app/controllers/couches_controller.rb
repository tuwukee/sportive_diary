class CouchesController < ApplicationController
  before_filter :couch_required

  def index
  end

  def manage_teams
  end

  private

  def couch_required
  	unless current_user
  	  flash[:alert] = "You need to sign in or to sign up"
  	  redirect_to root_path
  	else if !current_user.couch?
        flash[:alert] = "You have to be a coach to have the rights to visit this page"
        redirect_to root_path
      end
    end
  end
end
