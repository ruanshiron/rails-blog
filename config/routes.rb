Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  scope "(:locale)", locale: /en|vi/ do
    resources :posts
    devise_for :users
    root 'pages#home'
    get 'pages/help'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :users, only: [:show]
  end
end
