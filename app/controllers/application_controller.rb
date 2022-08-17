# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Before any page loads, find current user
  before_action :find_current_user

  def find_current_user
    @current_user = (User.find(session[:user_id]) if logged_in?)
  end

  # check login status
  def check_login
    redirect_to new_session_path unless logged_in?
  end

  def logged_in?
    session[:user_id].present?
  end

  helper_method :logged_in?

  def owner?(user)
    user == find_current_user
  end

  helper_method :owner?
end
