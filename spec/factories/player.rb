FactoryGirl.define do
  factory :player do
    sequence(:email) { |n| "player#{n}@example.com" }
    password 'password'
    password_confirmation 'password'

    after(:build) do |player|
      player.profile ||= FactoryGirl.build(:profile)
    end
  end
end
