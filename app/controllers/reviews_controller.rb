class ReviewsController < ApplicationController
  def index
    @reviews = [
      "The Smile",
      "Five Guys",
      "St John",
      "Baby Bo's"
    ]
  end

  def new

  end
end
