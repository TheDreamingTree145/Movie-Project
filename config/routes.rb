Rails.application.routes.draw do

  root to: 'welcome#home'
  post '/movies/:id/add', to: 'movies#add'
  post '/movies/:id/remove', to: 'movies#remove'
  get '/top_rated', to: 'static#top_rated', as: 'top_rated'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"}
  resources :users
  resources :genres, only: [:index, :show]
  resources :characters, only: [:create]

  resources :movies do
    resources :actors, only: [:index, :show]
    resources :characters, only: [:new, :show]
  end

  resources :actors, only: [:index, :new, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
