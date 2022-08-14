# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]
  before_action :check_login, except: %i[index show]

  # READ

  def index
    @price = params[:price]
    @cuisine = params[:cuisine]
    @location = params[:location]

    @reviews = Review.all
    @cuisines = Review.distinct.pluck(:cuisine)

    @reviews = @reviews.price(@price) if @price.present?

    @reviews = @reviews.cuisine(@cuisine) if @cuisine.present?

    @reviews = @reviews.near(@location) if @location.present?
  end

  def show; end

  # CREATE

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = @current_user
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  # UPDATE

  def edit; end

  def update
    if @review.update(review_params)
      redirect_to @review
    else
      render :edit
    end
  end

  # DELETE

  def destroy
    @review.destroy

    redirect_to root_path
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :restaurant, :body, :cuisine, :price, :score, :ambiance, :address)
  end
end
