class Couch < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  attr_accessible :email, :password, :password_confirmation
end
