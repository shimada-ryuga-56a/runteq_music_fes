require 'rails_helper'

RSpec.describe "Users", type: :system do
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
  end
end
