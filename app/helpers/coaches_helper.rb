module CoachesHelper
  def five_days_inactive?(player)
    Date.today.to_datetime > player.last_sign_in_at + 5.days
  end
end