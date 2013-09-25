class PlayersController < ApplicationController
  before_filter :find_player, :only => [:show]

  def show
  	respond_to do |format|
      format.json { render :json => { :player => [@player.as_json, @player.profile] } }
    end
  end

  private

  def find_player
    @player = Player.find params[:id]
  end
end
