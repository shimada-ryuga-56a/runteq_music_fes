class AttendeesController < ApplicationController
  def index
    @attendees = User.where(attend?: true)
  end
end
