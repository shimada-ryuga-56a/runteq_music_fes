# frozen_string_literal: true

class AttendeesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @attendees = User.where(is_attending: true).order(updated_at: :desc)
  end
end
