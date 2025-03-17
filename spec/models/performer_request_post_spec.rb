# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PerformerRequestPost, type: :model do
  describe 'validation' do
    context 'when all attributes are present' do
      it 'is valid' do
        post = build(:correct_performer_request_post)
        expect(post).to be_valid
      end
    end

    context 'when offer_or_request is missing' do
      it { is_expected.to validate_presence_of :offer_or_request }
    end

    context 'when comment is missing' do
      it { is_expected.to validate_presence_of :comment }
    end
  end
end
