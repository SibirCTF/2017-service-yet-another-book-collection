# frozen_string_literal: true

Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get 'admin_panel' => 'users#admin'
  get '/news' => 'news#last'
  resources :books do
    resources :reviews
  end
  root 'books#index'
end
