# frozen_string_literal: true

class ArtistMember < ApplicationRecord
  belongs_to :user
  belongs_to :artist
end
