class Player < ActiveRecord::Base
  extend Authentication
  include SelfIdentification

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  attr_accessible :email, :password, :password_confirmation, :team_id, :coach_id
  attr_accessor :coach_code

  has_and_belongs_to_many :team
  belongs_to :coach
end
