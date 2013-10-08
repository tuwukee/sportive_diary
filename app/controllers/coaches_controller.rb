class CoachesController < ApplicationController
  include CoachesHelper
  before_filter :coach_required
  before_filter :find_coach, :only => [:show]

  def index
  end

  def manage_teams
  end

  def show
  end

  private

  def find_coach
    @coach = Coach.find(params[:id], :include => :profile)
  end
end
