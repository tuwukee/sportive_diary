module Authentication
  def authenticate(warden_email, warden_password)
    user = where(["lower(email) = :email", { :email => warden_email.strip.downcase }]).first
    user.valid_password?(warden_password) ? user : nil
  end
end