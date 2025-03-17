# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# ユーザー
puts '== Creating Users =='

20.times do |i|
  User.find_or_create_by!(email: "example#{i}@email.com") do |user|
    puts '*'
    user.username = "example#{i}"
    user.email = "example#{i}@email.com"
    user.password = 'password'
    user.password_confirmation = 'password'
    user.role = i % 3
    user.term = i * 3
    user.is_attending = true
  end
end

# 出演希望者掲示板
puts '== Creating PerformerRequestPosts =='
10.times do |i|
  PerformerRequestPost.find_or_create_by!(comment: "comment#{i}") do |post|
    puts '*'
    post.offer_or_request = i % 2
    post.user_id = 1
    post.comment = "comment#{i}"
  end
end
