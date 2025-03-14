FactoryBot.define do
  factory :artist_member do
    association :user
    association :artist
  end
end
