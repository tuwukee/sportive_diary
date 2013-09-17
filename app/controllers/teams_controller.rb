class TeamsController < ApplicationController
  before_filter :find_team, :only => [:update]

  def update
  	if player = Player.find(params[:player_id])
      @team.players << player unless @team.players.include? player
    end
    render :json => @team
  end

  private

  def find_team
    @team = Team.find_by_id(params[:id]) || not_found
  end
end