# frozen_string_literal: true

module UsersHelper
  def add_handle(username)
    "@#{username}"
  end
end
