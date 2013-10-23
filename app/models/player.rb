class Player < ActiveRecord::Base
  extend Authentication
  include SelfIdentification

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :trackable

  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :team_id,
                  :coach_id,
                  :profile_attributes

  attr_accessor :coach_code

  has_and_belongs_to_many :team
  belongs_to :coach
  has_one :profile, :dependent => :destroy

  accepts_nested_attributes_for :profile, :allow_destroy => true
end
