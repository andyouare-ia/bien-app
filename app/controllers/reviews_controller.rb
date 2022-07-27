class ReviewsController < ApplicationController

  before_action :set_review, only: [:show, :edit, :update, :destroy]

  #READ

  def index
    @reviews = Review.all
  end

  def show
  end

  #CREATE

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  #UPDATE

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review
    else
      render :edit
    end
  end

  #DELETE

  def destroy
    @review.destroy

    redirect_to reviews_path
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :restaurant, :body, :score, :ambiance)
  end
end
