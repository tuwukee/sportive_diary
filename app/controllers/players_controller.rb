class PlayersController < ApplicationController
  before_filter :find_player, :only => [:show, :update]

  def index
    render :json => current_user.players.to_json(:include => [:profile, :plan])
  end

  def show
    respond_to do |format|
      format.json { render :json => { :player => [@player.as_json.merge({:last_login => @player.last_sign_in_at}), @player.profile] } }
    end
  end

  def update
    @player.update_attribute(:plan_id, params[:plan_id]) if params[:plan_id].present?
    @player.update_attribute(:plan_id, nil) if params[:remove_plan].present?

    render :json => @player
  end

  private

  def find_player
    @player = Player.find params[:id] || not_found
  end
end
