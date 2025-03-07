class AttendeesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @attendees = User.where(attend?: true).order(updated_at: :desc)
  end
end
