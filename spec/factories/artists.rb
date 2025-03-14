FactoryBot.define do
  alphabets = ('A'..'Z').to_a
  sequence :name do |n|
    "#{alphabets.sample}#{n}"
  end

  factory :artist do
    name { generate(:name) }
    performance_category { "band" }
    requested_play_time { "five_minutes" }
    performance_content { 'performance_content' }

    after(:build) do |artist|
      user1 = create(:user)
      user2 = create(:user)
      artist.artist_members << build(:artist_member, artist: artist, user: user1)
      artist.artist_members << build(:artist_member, artist: artist, user: user2)
    end
  end

  factory :correct_artist, class: Artist do
    name { generate(:name) }
    performance_category { "band" }
    requested_play_time { "five_minutes" }
    performance_content { 'performance_content' }

    after(:build) do |artist|
      user1 = create(:user)
      user2 = create(:user)
      artist.artist_members << build(:artist_member, artist: artist, user: user1)
      artist.artist_members << build(:artist_member, artist: artist, user: user2)
    end
  end
end
