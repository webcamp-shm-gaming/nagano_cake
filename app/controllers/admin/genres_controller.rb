class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
     redirect_to admin_genres_path, notice: "ジャンル名を登録しました"
    else
      @genres = Genre.all
      render :index
    end
  end


  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: "ジャンル名を編集しました"
    else
      render :edit
    end
  end

  private

  # def set_genre
  #   @genre = Genre.find(params[:id])
  # end

  def genre_params
    params.require(:genre).permit(:item_id, :name)
  end
end
