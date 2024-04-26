# frozen_string_literal: true

Rails.application.routes.draw do
  resources :user_preferred_classes
  resources :user_preferred_days
  resources :preferred_days
  get 'welcome/index'
  resources :user_profiles
  resources :type_profiles
  resources :schedules
  resources :lessons
  namespace :administrate do
    resources :users
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  get '/cadastro_usuarios', to: 'users#index'
  get '/tipo_de_usuarios', to: 'type_profiles#index'
  # Defines the root path route ("/")
  root 'welcome#index'
end
