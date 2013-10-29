class PlansController < ApplicationController
  include CoachesHelper
  before_filter :coach_required
  before_filter :set_coach, :only => [:create]
  before_filter :find_plan, :only => [:destroy, :update]

  def index
    @plans = current_user.plans
    respond_to do |format|
      format.js { render :json => Plan.all }
      format.html
    end

  end

  def create
    plan = Plan.create params[:plan]
    render :json => plan
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

  def set_coach
    params[:plan][:coach_id] = current_user.id
  end
end
