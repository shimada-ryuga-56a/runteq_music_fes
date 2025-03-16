# frozen_string_literal: true

Rails.application.routes.draw do
  get 'static_pages/top'
  devise_for :users, skip: :all
  devise_scope :user do
    get 'users/sign_in' => 'devise/sessions#new', as: :new_user_session
    post 'users/sign_in' => 'devise/sessions#create', as: :user_session
    delete 'users/sign_out' => 'devise/sessions#destroy', as: :destroy_user_session
    get 'users/sign_up' => 'devise/registrations#new', as: :new_user_registration
    post 'users' => 'devise/registrations#create', as: :user_registration
    get 'users/edit' => 'users/registrations#edit', as: :edit_user_registration
    patch 'users' => 'users/registrations#update'
    put 'users' => 'users/registrations#update'
    patch 'users/attend_status' => 'users/registrations#attend_status_update'
  end

  resources :attendees, only: %i[index]
  resource :accesses, only: %i[show]
  resources :artists, only: %i[index new create]

  resources :performer_request_posts

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'static_pages#top'
end
