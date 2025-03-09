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
    respond_to do |format|
      if @artist.save
        format.html { redirect_to artists_path, notice: '出演登録が完了しました🎉🎉🎉' }
      else
        flash.now[:alert] = I18n.t('flash.error.submit_failed')
        format.turbo_stream { render 'artists/turbo_streams/create_failure', status: :unprocessable_entity }
      end
    end
    p @artist.errors.full_messages
    p flash
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :performance_category, :requested_play_time, :performance_content, artist_members_attributes: [:id, :user_id, :_destroy])
  end
end
