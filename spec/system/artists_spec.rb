# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Artists', type: :system do
  before do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user)
  end

  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  describe '未ログイン時' do
    context 'artists/indexにアクセスしたとき' do
      it '一覧ページが表示される' do
        visit artists_path
        expect(page).to have_content '出演者情報'
      end
    end

    context 'artists/newにアクセスしたとき' do
      it 'ログイン画面にリダイレクトされる' do
        visit new_artist_path
        expect(page).to have_content 'ログイン'
      end
    end
  end

  describe 'ログイン時' do
    before do
      sign_in @user
    end

    context 'artists/indexにアクセスしたとき' do
      it '一覧ページが表示される' do
        visit artists_path
        expect(page).to have_content '出演者情報'
      end
    end

    context 'artists/newにアクセスしたとき' do
      it '新規登録画面が表示される' do
        visit new_artist_path
        expect(page).to have_content '出演希望申請フォーム'
      end
    end

    # context "artists/newでフォームを入力後" do
    #   it "アーティストの新規登録ができる", js: true do
    #     visit new_artist_path
    #     fill_in "artist_name", with: 'artist_name'
    #     select 'バンド', from: 'artist_performance_category'
    #     select '5分', from: 'artist_requested_play_time'
    #     click_button '＋メンバー追加'
    #     fill_in 'artist_performance_content', with: 'performance_content'
    #     click_button '送信'
    #     expect(current_path).to eq(artists_path)
    #     expect(page).to have_content '出演登録が完了しました'
    #   end
    # end
  end
end
