class TeamsController < ApplicationController
  before_filter :find_team, :only => [:update]
  before_filter :set_coach, :only => [:create]

  def create
    team = Team.create params[:team]
    render :json => team
  end

  def index
    render :json => current_user.teams.to_json(:include => { :players => { :include => :profile } })
  end

  def update
  	if player = Player.find(params[:player_id])
      @team.players << player unless @team.players.include? player
    end
    render :json => @team
  end

  private

  def set_coach
    params[:team][:coach_id] = current_user.id if current_user.coach?
  end

  def find_team
    @team = Team.find_by_id(params[:id]) || not_found
  end
end