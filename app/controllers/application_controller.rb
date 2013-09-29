class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  after_filter  :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  protected

  def current_user
    warden_info = nil
    session.select { |key, value| warden_info = value if key.to_s.match(/.*\.key/) }
    session["class_name"] ? session["class_name"].constantize.find(warden_info[0]).first : false
  end

  def verified_request?
    super || form_authenticity_token == request.headers['X_XSRF_TOKEN']
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
