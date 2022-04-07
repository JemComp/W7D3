FactoryBot.define do
  factory :user do
    username { Faker::Games::SuperSmashBros.fighter }
    password {'password'}
  end
end
