class Coaches::RegistrationsController < Devise::RegistrationsController
  after_filter :welcome, :only => [:create]

  def new
    build_resource({})
    self.resource.build_profile
    respond_with self.resource
  end

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
    CoachMailer.welcome(resource).deliver unless resource.invalid?
  end
end