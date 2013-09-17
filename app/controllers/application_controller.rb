class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  protected

  def current_user
    warden_info = nil
    session.select { |key, value| warden_info = value if key.to_s.match(/.*\.key/) }
    session["class_name"] ? session["class_name"].constantize.find(warden_info[0]).first : false
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
