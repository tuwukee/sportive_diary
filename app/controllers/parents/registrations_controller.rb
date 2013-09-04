class Parents::RegistrationsController < Devise::RegistrationsController
  def create
    super
    session[:class_name] = resource.class.name unless resource.invalid?
  end
end