# frozen_string_literal: true

class AttendeesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @q = User.ransack(params[:q])
    @attendees = @q.result(distinct: true).where(is_attending: true).order(updated_at: :desc)
  end
end
