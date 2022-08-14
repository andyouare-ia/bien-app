# frozen_string_literal: true

module ReviewsHelper
  def price_converter(price)
    if price == 1
      "$"
    elsif price == 2
      "$$"
    else
      "$$$"
    end
  end
end
