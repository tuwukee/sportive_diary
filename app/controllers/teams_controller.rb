class TeamsController < ApplicationController
  include CoachesHelper
  before_filter :coach_required
  before_filter :find_team, :only => [:update, :destroy]
  before_filter :set_coach, :only => [:create]
  after_filter :falsify_all_others, :only => [:update]

  def create
    team = Team.create params[:team]
    render :json => team
  end

  def index
    render :json => current_user.teams.to_json(:include => [ { :players => { :include => :profile } }, :plan] )
  end

  def update
    @team.update_attribute(:selected, true)
    @team.update_attribute(:plan_id, params[:plan_id]) if params[:plan_id].present?
    @team.update_attribute(:plan_id, nil) if params[:remove_plan].present?

    if params[:player_id].present?
      player = Player.find(params[:player_id])
      params[:remove] ?  @team.players.delete(player) :  (@team.players << player unless @team.players.include?(player))
    end

    render :json => @team
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  private

  def falsify_all_others
    current_user.teams.where('id != ?', @team.id).update_all("selected = 'false'")
  end

  def set_coach
    params[:team][:coach_id] = current_user.id
  end

  def find_team
    @team = Team.find_by_id(params[:id]) || not_found
  end
end