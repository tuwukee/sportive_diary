class Players::RegistrationsController < Devise::RegistrationsController
  before_filter :find_couch, :only => [:create]
  def create
    super
    session[:class_name] = resource.class.name unless resource.invalid?
  end

  private

  def find_couch
    code = params[:player].delete :couch_code

    if couch = Couch.find_by_code(code)
      params[:player][:couch_id] = couch.id
    else
      @player = Player.new params[:player]
      @player.errors[:couch_code] << "Entered couch code doesn't exist"
      render "new"
    end
  end
end