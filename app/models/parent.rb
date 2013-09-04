class Parent < ActiveRecord::Base
  extend Authentication
  include SelfIdentification

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  attr_accessible :email, :password, :password_confirmation
end
