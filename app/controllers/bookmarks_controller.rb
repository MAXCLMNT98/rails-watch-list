class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def new
    # @list = List.find(params[:list_id])

    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # @list = List.find(params[:list_id])
    # @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark.list = @list
    # @bookmark.movie = @movie
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
