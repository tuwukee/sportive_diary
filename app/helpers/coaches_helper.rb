module CoachesHelper
  def five_days_inactive?(player)
    Date.today.to_datetime > player.last_sign_in_at + 5.days
  end

  private

  def coach_required
    unless current_user
      flash[:alert] = "You need to sign in or to sign up"
      redirect_to root_path
    else if !current_user.coach?
        flash[:alert] = "You have to be a coach to have the rights to visit this page"
        redirect_to root_path
      end
    end
  end
end