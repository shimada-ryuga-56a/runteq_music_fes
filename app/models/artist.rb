class Artist < ApplicationRecord
  validates :name, presence: true
  validates :performance_category, presence: true
  validates :requested_play_time, presence: true

  enum performance_category: { band: 0, dance: 1, acoustic: 2, session: 3, instrumental: 4, other: 5 }
  enum requested_play_time: { five_minutes: 0, ten_minutes: 1, fifteen_minutes: 2, twenty_minutes: 3, twenty_five_minutes: 4 }

  has_many :artist_members, dependent: :destroy
  accepts_nested_attributes_for :artist_members, reject_if: :all_blank, allow_destroy: true

  has_many :users, through: :artist_members
end
