FactoryBot.define do
  factory :performer_request_post do
    offer_or_request { 1 }
    user_id { 1 }
    comment { "MyText" }
  end
end
