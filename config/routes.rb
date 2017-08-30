Rails.application.routes.draw do

  post '/movies/:id/add', to: 'movies#add'
  post '/movies/:id/remove', to: 'movies#remove'
  resources :characters
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"}
  resources :users
  resources :genres, only: [:index, :show]

  resources :movies
  resources :actors

  root to: 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
