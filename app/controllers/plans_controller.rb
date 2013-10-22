class PlansController < ApplicationController
  include CoachesHelper
  before_filter :coach_required
  before_filter :find_plan, :only => [:destroy]

  def index
    @plans = current_user.plans
  end

  def destroy
    @plan.destroy
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  private

  def find_plan
    @plan = Plan.find params[:id]
  end
end
