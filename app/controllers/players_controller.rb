class PlayersController < ApplicationController
  before_filter :find_player, :only => [:show]

  def index
    render :json => current_user.players.to_json(:include => :profile)
  end

  def show
  	respond_to do |format|
      format.json { render :json => { :player => [@player.as_json.merge({:last_login => @player.last_sign_in_at}), @player.profile] } }
    end
  end

  private

  def find_player
    @player = Player.find params[:id]
  end
end
