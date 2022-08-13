# frozen_string_literal: true

Rails.application.routes.draw do
  root 'reviews#index'

  resources :reviews do
    resources :comments
  end

  resources :users

  resource :session, only: [:new, :create, :destroy]
end
