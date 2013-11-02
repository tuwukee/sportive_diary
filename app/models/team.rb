class Team < ActiveRecord::Base
  attr_accessible :coach_id, :name, :description, :plan_id

  has_and_belongs_to_many :players
  belongs_to :coach
  belongs_to :plan
end
