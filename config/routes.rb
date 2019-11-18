Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :users

 



  resources :searches

  resources :posts do
    resources :reviews
  end


end