class Coach < ActiveRecord::Base
  extend Authentication
  include SelfIdentification

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :code,
                  :profile_attributes

  has_many :teams
  has_many :players
  has_one :profile, :dependent => :destroy

  accepts_nested_attributes_for :profile, allow_destroy: true
end
