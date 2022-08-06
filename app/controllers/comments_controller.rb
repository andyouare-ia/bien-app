class CommentsController < ApplicationController


  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new(comment_params)
    @comment.save
    redirect_to @review
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
