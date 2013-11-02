class Plan < ActiveRecord::Base
  attr_accessible :coach_id, :name, :description
  belongs_to :coach
  has_many :drills
  has_many :teams

  validates :name, :presence => true
end
