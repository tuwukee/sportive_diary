module ApplicationHelper
  def current_user
    session["class_name"] ? session["class_name"].constantize.find(session["warden.user.player.key"][0]) : false
  end
end
