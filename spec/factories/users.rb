# frozen_string_literal: true

FactoryBot.define do
  alphabets = ('a'..'z').to_a
  sequence :email do |n|
    "#{alphabets.shuffle.join}#{n}@example.com"
  end
  sequence :username do |n|
    alphabets.shuffle.join + n.to_s
  end

  factory :user do
    email { generate(:email) }
    password { 'password' }
    password_confirmation { 'password' }
    username { generate(:username) }
  end

  factory :correct_user, class: User do
    email { generate(:email) }
    password { 'password' }
    password_confirmation { 'password' }
    username { generate(:username) }
  end
end
