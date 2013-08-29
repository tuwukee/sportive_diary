class Team < ActiveRecord::Base
  attr_accessible :coach_id, :name

  has_many :players
  belongs_to :coach
end
