class HomeController < ApplicationController
  def home
    if current_user && current_user.coach?
      @team = current_user.teams.where(:selected => true).first
    end
  end
end