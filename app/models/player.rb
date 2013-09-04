class Player < ActiveRecord::Base
  extend Authentication
  include SelfIdentification

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  attr_accessible :email, :password, :password_confirmation, :team_id
  attr_accessor :couch_code

  belongs_to :team
  belongs_to :coach
end
