# frozen_string_literal: true

FactoryBot.define do
  factory :performer_request_post do
    offer_or_request { 0 }
    comment { 'MyText' }
    user
  end

  factory :correct_performer_request_post, class: PerformerRequestPost do
    offer_or_request { 0 }
    comment { 'MyText' }
    user
  end
end
