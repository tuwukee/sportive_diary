module ApplicationHelper
  def current_user
    warden_info = nil
    session.select { |key, value| warden_info = value if key.to_s.match(/.*\.key/) }
    session["class_name"] ? session["class_name"].constantize.find(warden_info[0]).first : false
  end
end
