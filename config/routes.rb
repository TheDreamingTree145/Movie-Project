Rails.application.routes.draw do

  resources :characters
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"}
  resources :users 

  resources :movies
  resources :actors

  root to: 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
