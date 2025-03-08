class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @artists = Artist.all
  end

  def new
  end

  def create
  end
end
