# frozen_string_literal: true

Rails.application.routes.draw do
  root 'reviews#index'

  resources :reviews do
    resources :comments
    resource :bookmark, only: %i[create destroy]
  end

  resources :users

  resource :session, only: %i[new create destroy]
end
