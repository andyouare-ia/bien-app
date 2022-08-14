# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :reviews
  has_many :comments

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def to_param
    username
  end
end
