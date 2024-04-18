class  Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.page(params[:page])
  end

  def update
    @genres = Genre.find(params[:id])
  if @genres.update(genre_params)
    redirect_to admin_genres_index_path, notice: "Genre was successfully updated."
  else
    render :edit
  end
  end

  def edit
    @genre=Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
   if@genre.save
    redirect_to admin_genres_index_path
   end
  end
  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
