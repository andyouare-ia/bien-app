class Bookmark < ApplicationRecord
  belongs_to :review
  belongs_to :user

  # a user can only have one bookmark per review
  validates :review, uniqueness: { scope: :user }
end
