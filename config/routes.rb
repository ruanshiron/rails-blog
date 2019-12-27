Rails.application.routes.draw do
  resources :posts
  resources :users, only: [:show]
  devise_for :users
  root 'pages#home'
  get 'pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
