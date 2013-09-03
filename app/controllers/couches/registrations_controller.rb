class Couches::RegistrationsController < Devise::RegistrationsController
  after_filter :welcome, :only => [:create]

  def create
    super

    unless resource.invalid?
      resource.code = generated_code
      resource.save
      session[:class_name] = resource.class.name
    end
  end

  private

  def generated_code
    SecureRandom.uuid
  end

  def welcome
    CouchMailer.welcome(resource).deliver unless resource.invalid?
  end
end