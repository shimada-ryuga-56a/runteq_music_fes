class AttendeesController < ApplicationController
  def index
    @attendees = User.where(attend?: true).order(updated_at: :desc)
  end
end
