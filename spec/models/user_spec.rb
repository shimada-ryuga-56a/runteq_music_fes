# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:correct_user) { build(:correct_user) }

  describe 'validations' do
    context 'when the user is valid' do
      it 'is valid' do
        expect(correct_user).to be_valid
      end
    end

    context 'when the username is nil' do
      it { is_expected.to validate_presence_of :username }
    end

    context 'when the email is nil' do
      it { is_expected.to validate_presence_of :email }
    end

    context 'when the password is nil' do
      it { is_expected.to validate_presence_of :password }
    end

    context 'when the password_confirmation is not equal to the password' do
      it 'is invalid' do
        user = build(:user, password: 'password', password_confirmation: 'password1')
        expect(user).to be_invalid
      end
    end
  end

  describe 'methods' do
    context '#x_profile_link' do
      it 'returns the x profile link' do
        user = build(:user, x_id: 1)
        expect(user.x_profile_link).to eq('https://x.com/1')
      end
    end

    context '#times_channel_name' do
      it 'returns the times channel name' do
        user = build(:user, mattermost_link: 'https://mattermost.com/channels/1')
        expect(user.times_channel_name).to eq('1')
      end
    end
  end
end
