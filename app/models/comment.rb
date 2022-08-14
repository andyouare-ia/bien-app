# frozen_string_literal: true

class Comment < ApplicationRecord
  #  associations
  belongs_to :review
  belongs_to :user

  #  validations
  validates :body, presence: true

  # profanity_filter gem => all letters will be replaced with *
  profanity_filter :body, method: 'vowels'
end
