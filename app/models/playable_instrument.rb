# frozen_string_literal: true

class PlayableInstrument < ApplicationRecord
  belongs_to :user

  validates :instrument_name, presence: true
  validates :hope_for_matching?, inclusion: { in: [true, false] }
end
