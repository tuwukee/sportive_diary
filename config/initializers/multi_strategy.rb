Warden::Strategies.add(:multi_strategy) do
  def valid?
    params['email'] && params['password']
  end

  def authenticate!
    user = Coach.authenticate(params['email'], params['password'])
    user ||= Player.authenticate(params['email'], params['password'])
    user ||= Parent.authenticate(params['email'], params['password'])

    user.nil? ? fail!("Could not log in") : success!(user)
  end
end