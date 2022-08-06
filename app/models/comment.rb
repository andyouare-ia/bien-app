class Comment < ApplicationRecord

  #  associations
  belongs_to :review

  #  validations
  validates :body, presence: true
end
