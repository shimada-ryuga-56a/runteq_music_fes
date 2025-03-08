class ArtistMember < ApplicationRecord
  belongs_to :user
  belongs_to :artist
end
