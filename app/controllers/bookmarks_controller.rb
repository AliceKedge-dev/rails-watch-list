class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end
  def new
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new
    @movies = Movie.all
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)
    @bookmark.save
    redirect_to list_path(@list), notice: 'Bookmark created successfully.'
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@list), notice: 'Bookmark deleted successfully.'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
