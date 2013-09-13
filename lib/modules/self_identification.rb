module SelfIdentification
  def player?
    self.class.name == "Player"
  end

  def coach?
    self.class.name == "Coach"
  end

  def parent?
    self.class.name == "Parent"
  end
end