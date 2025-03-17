# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'sign up' do
    context 'when the user is valid' do
      it 'creates the user' do
        visit new_user_registration_path
        fill_in 'user_email', with: 'example@email.com'
        fill_in 'user_username', with: 'username'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_button '登録'
        expect(page).to have_content('アカウント登録が完了しました。')
      end
    end
  end

  describe 'sign in' do
    let(:user) { create(:user) }

    context 'when the user is valid' do
      it 'signs in the user' do
        visit new_user_session_path
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        click_button 'ログイン'
        expect(page).to have_content('ログインしました。')
      end
    end

    context 'when the user is invalid' do
      it 'does not sign in the user' do
        visit new_user_session_path
        fill_in 'user_email', with: 'undefined@email.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content('Eメールまたはパスワードが違います。')
      end
    end
  end

  describe 'logged in' do
    before do
      @attend_user = create(:attend_user)
      @not_attend_user = create(:not_attend_user)
      @user = create(:user)
    end

    context 'when the user is logged in' do
      it 'shows mypage' do
        sign_in @user
        visit edit_user_registration_path
        expect(page).to have_content('マイページ')
      end
    end

    context 'when the user is attending' do
      it 'shows the cancel button' do
        sign_in @attend_user
        visit attendees_path
        expect(page).to have_content('参加の取り消しはこちらから行ってください。')
      end

      it 'cancels the attendance with the cancel button' do
        sign_in @attend_user
        visit attendees_path
        click_link 'こちら'
        expect(page).to have_content('参加をキャンセルしました')
      end
    end

    context 'when the user is not attending' do
      it 'shows the attend button' do
        sign_in @not_attend_user
        visit attendees_path
        expect(page).to have_content('参加希望の場合はこちらから登録してください。')
      end

      it 'attends with the attend button' do
        sign_in @not_attend_user
        visit attendees_path
        click_link 'こちら'
        expect(page).to have_content('参加を申し込みました')
      end
    end
  end
end
