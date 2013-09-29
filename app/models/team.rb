class Team < ActiveRecord::Base
  attr_accessible :coach_id, :name, :description

  has_and_belongs_to_many :players
  belongs_to :coach
end
