class Plan < ActiveRecord::Base
  attr_accessible :coach_id
  belongs_to :coach
end
