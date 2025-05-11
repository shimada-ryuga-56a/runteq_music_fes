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

@artists = ['あいみょん', 'BUMP OF CHICKEN', 'King Gnu', 'Mrs. GREEN APPLE', 'Official髭男dism', 'Perfume', 'RADWIMPS',
            'Reol', '米津玄師', 'YOASOBI', 'ヨルシカ', '和楽器バンド']

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

# さらなるユーザー（適当な名前、期）（is_attendingはtrue）
puts '== Creating More Users =='
10.times do |i|
  User.find_or_create_by!(email: "example#{i + 1})@example.com") do |user|
    puts '*'
    hiragama = %w[あ い う え お か き く け こ さ し す せ そ た ち つ て と な に ぬ ね の は ひ ふ へ ほ]
    kanji = %w[亜 伊 宇 江 佳 希 久 佐 志 須 瀬 曽 多 千 津 天 那 二 ぬ ね の 波 比 ふ へ 保]
    # hiraganaとkanjiをランダムに選ぶ
    random_hiragana = hiragama.sample(3).join
    random_kanji = kanji.sample(3).join
    user.username = "#{random_hiragana}#{random_kanji}"
    user.email = "example#{i + 1})@example.com"
    user.password = 'password'
    user.password_confirmation = 'password'
    user.term = i * 2
    user.is_attending = true
    user.mattermost_link = "https://example.com/#{user.username}"
    user.portfolio_link = "https://example.com/#{user.username}"
  end
end

puts '== Deleting No Title PerformerRequestPosts =='
@no_title_performer_request_posts = PerformerRequestPost.where(title: 'title')
@no_title_performer_request_posts.each do |post|
  puts '*'
  post.destroy
end

# 出演募集 掲示板
puts '== Creating PerformerRequestPosts =='
10.times do |i|
  PerformerRequestPost.find_or_create_by!(comment: "comment#{i}", title: "title#{i}") do |post|
    puts '*'
    post.title = "募集タイトル#{i}"
    post.user_id = 1
    post.comment = "#{@artists[i]}の、〇〇のパートを募集しています。"
  end
end
