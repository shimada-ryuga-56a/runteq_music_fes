class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    p @artist
    if @artist.save
      redirect_to artists_path, notice: 'アーティストを登録しました'
    else
      render :new, alert: 'アーティストの登録に失敗しました'
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :performance_category, :requested_play_time, :performance_content, artist_members_attributes: [:id, :user_id, :_destroy])
  end
end
