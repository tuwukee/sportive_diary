class Drill < ActiveRecord::Base
  attr_accessible :name, :repetitions, :plan_id, :description
  belongs_to :plan

  validates :name, :presence => true
end
