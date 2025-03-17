# frozen_string_literal: true

class PerformerRequestPost < ApplicationRecord
  validates :offer_or_request, presence: true
  validates :comment, presence: true

  belongs_to :user

  enum offer_or_request: { offer: 0, request: 1 }
end
