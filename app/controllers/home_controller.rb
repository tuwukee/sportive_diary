class HomeController < ApplicationController
  def home
    @players = current_user.players(:joins => :profiles) if current_user && current_user.coach?
  end
end