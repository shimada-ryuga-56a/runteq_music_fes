class Artist < ApplicationRecord
  validates :name, presence: true
  validates :performance_category, presence: true
  validates :requested_play_time, presence: true

  enum performance_category: { band: 0, dance: 1, accostic: 2, session: 3, instrumental: 4, other: 5 }

  has_many :artist_members, dependent: :destroy
  has_many :users, through: :artist_members
end
