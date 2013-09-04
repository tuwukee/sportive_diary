module SelfIdentification
  def player?
    self.class.name == "Player"
  end

  def couch?
    self.class.name == "Couch"
  end

  def parent?
    self.class.name == "Parent"
  end
end