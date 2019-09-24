Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  dlete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end

  root to: 'tasks#index'
  resources :tasks
end
