class DrillsController < ApplicationController
  def index
    render :json => Drill.all.to_json
  end
end