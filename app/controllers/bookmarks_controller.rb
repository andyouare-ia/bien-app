class BookmarksController < ApplicationController

  before_action :check_login

  def create
    @bookmark = Bookmark.create(review_id: params[:review_id], user_id: @current_user.id)
    redirect_to @bookmark.review
  end

  def destroy
    @bookmark = Bookmark.find_by(review_id: params[:review_id], user_id: @current_user.id)
    @bookmark.delete
    redirect_to @bookmark.review
  end
end
