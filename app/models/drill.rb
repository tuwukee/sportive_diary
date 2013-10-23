class Drill < ActiveRecord::Base
  attr_accessible :name, :repetitions
  belongs_to :plan

  validates :name, :presence => true
end
