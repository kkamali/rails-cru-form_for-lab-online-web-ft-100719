class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(post_params(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.update(post_params(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  private

  def post_params(*args)
    params.require(:song).permit(*args)
  end
end
