class Player < ActiveRecord::Base
  extend Authentication
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  attr_accessible :email, :password, :password_confirmation, :team_id

  belongs_to :team
  belongs_to :coach
end
