# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new(comment_params)
    @comment.user = @current_user
    @comment.save
    redirect_to @review
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
