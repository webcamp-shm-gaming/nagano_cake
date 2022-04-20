class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:item_id)
  end
end
