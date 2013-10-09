class CoachesController < ApplicationController
  include CoachesHelper
  before_filter :coach_required
  before_filter :find_coach, :only => [:show, :edit, :update]

  def manage_teams
  end

  def update
    if @coach.update_attributes(params[:coach])
      flash[:notice] = "Successfully updated."
      redirect_to @coach
    else
      render "edit"
    end
  end

  private

  def find_coach
    @coach = Coach.find(params[:id], :include => :profile)
  end
end
