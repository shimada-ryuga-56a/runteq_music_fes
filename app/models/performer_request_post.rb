# frozen_string_literal: true

class PerformerRequestPost < ApplicationRecord
  validates :title, presence: true
  validates :comment, presence: true

  belongs_to :user
end
