# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :books, only: %i[index show edit create destroy update] do
    resource :favorites, only: %i[create destroy]
    resources :book_comments, only: %i[create destroy]
  end
  resources :users, only: %i[index show edit update] do
    resource :relationships, only: %i[index create destroy] do
      collection do
        get 'followers'
        get 'followed'
      end
    end
  end

  resources :groups do
    resource :group_users, only: %i[create destroy]
    resources :notices, only: %i[new create]
  end

  get 'search' => 'searches#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
