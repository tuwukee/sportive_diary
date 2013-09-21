class Players::RegistrationsController < Devise::RegistrationsController
  before_filter :find_coach, :only => [:create]

   def new
    build_resource({})
    self.resource.build_profile
    respond_with self.resource
  end

  def create
    super

    session[:class_name] = resource.class.name unless resource.invalid?
  end

  private

  def find_coach
    code = params[:player].delete :coach_code

    if coach = Coach.find_by_code(code)
      params[:player][:coach_id] = coach.id
    else
      @player = Player.new params[:player]
      @player.errors[:coach_code] << "Entered coach code doesn't exist"
      render "new"
    end
  end
end