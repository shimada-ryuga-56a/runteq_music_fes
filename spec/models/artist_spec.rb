require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'validations' do
    context "when all attributes are present" do
      it "is valid" do
        artist = build(:correct_artist)
        expect(artist).to be_valid
      end
    end

    context "when name is missing" do
      it { is_expected.to validate_presence_of :name }
    end

    context "when performance_category is missing" do
      it { is_expected.to validate_presence_of :performance_category }
    end

    context "when requested_play_time is missing" do
      it { is_expected.to validate_presence_of :requested_play_time }
    end

    context "when artist_members is missing" do
      it { is_expected.to validate_presence_of :artist_members }
    end
  end
end
