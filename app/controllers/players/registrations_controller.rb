class Players::RegistrationsController < Devise::RegistrationsController
  def create
    super
    session[:class_name] = resource.class.name
  end
end