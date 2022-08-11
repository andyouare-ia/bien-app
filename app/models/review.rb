# frozen_string_literal: true

class Review < ApplicationRecord
  # associations
  has_many :comments

  # validations
  geocoded_by :address
  after_validation :geocode

  validates :title, presence: true
  validates :body, length: { minimum: 10 }
  validates :price, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: 3 }
  validates :score, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: 10 }
  validates :restaurant, presence: true
  validates :address, presence: true

  # filters
  scope :price, ->(amount) { where('price = ?', amount) }
  scope :cuisine, ->(cuisine) { where('lower(cuisine) =?', cuisine.downcase) }

  # methods
  def to_param
    "#{id}-#{title.parameterize}"
  end
end
