# frozen_string_literal: true

FactoryBot.define do
  factory :performer_request_post do
    title { 'title' }
    comment { 'MyText' }
    user
  end

  factory :correct_performer_request_post, class: PerformerRequestPost do
    title { 'title' }
    comment { 'MyText' }
    user
  end
end
