class Profile < ActiveRecord::Base
  belongs_to :player
  belongs_to :coach

  attr_accessible :first_name,
                  :last_name,
                  :birthday,
                  :coach_id,
                  :player_id

  as_enum :gender, :male => 0, :female => 1

  validates :first_name, :last_name, :presence => true,
            :length => { :maximum => 255 }

  scope :players, where('profiles.coach_id = ?', nil)
  scope :coaches, where('profiles.player_id = ?', nil)

  def full_name
    [first_name, last_name].join(" ")
  end
end
