# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PerformerRequestPosts', type: :system do
  before do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user)
  end

  let!(:correct_performer_request_post) { FactoryBot.create(:correct_performer_request_post) }
  let!(:correct_performer_request_post_create) { FactoryBot.create(:correct_performer_request_post) }

  describe '未ログイン時' do
    context 'performer_request_posts/newにアクセスしたとき' do
      it 'ログイン画面にリダイレクトされる' do
        visit new_performer_request_post_path
        expect(page).to have_content 'ログインもしくはアカウント登録してください。'
      end
    end

    context 'performer_request_postsにアクセスしたとき' do
      it '一覧画面が表示される' do
        visit performer_request_posts_path
        expect(page).to have_content '出演募集 掲示板'
      end
    end
  end

  describe 'ログイン時' do
    before do
      sign_in @user
    end

    context 'performer_request_posts/newにアクセスしたとき' do
      it '新規登録画面が表示される' do
        visit new_performer_request_post_path
        expect(page).to have_content '出演募集 掲示板 投稿ページ'
      end
    end

    context 'performer_request_posts/newでフォームを入力後' do
      it '出演希望申請ができる', js: true do
        visit new_performer_request_post_path
        select '出演希望', from: 'performer_request_post_offer_or_request'
        fill_in 'performer_request_post_comment', with: 'comment'
        click_button '投稿する'
        expect(current_path).to eq(performer_request_posts_path)
        expect(page).to have_content '投稿が完了しました'
      end
    end

    context 'performer_request_postsにアクセスしたとき' do
      it '一覧画面が表示される' do
        visit performer_request_posts_path
        expect(page).to have_content '出演募集 掲示板'
      end
    end

    context '自分の投稿の編集画面にアクセスしたとき' do
      it '編集画面が表示される' do
        post = @user.performer_request_posts.create(offer_or_request: 'offer', comment: 'comment')
        visit edit_performer_request_post_path(post)
        expect(page).to have_content '出演募集 掲示板 投稿編集'
      end

      it '編集ができる' do
        post = @user.performer_request_posts.create(offer_or_request: 'offer', comment: 'comment')
        visit edit_performer_request_post_path(post)
        fill_in 'performer_request_post_comment', with: 'comment2'
        click_button '更新する'
        expect(current_path).to eq(performer_request_posts_path)
        expect(page).to have_content '編集が完了しました'
      end
    end
  end
end
