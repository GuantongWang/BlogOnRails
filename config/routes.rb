Rails.application.routes.draw do

  get 'posts/index'

  get 'posts/show'

  devise_for :users
    
  root to: 'home#index'

  resources :posts, only:[:index, :show] do
    resources :comments
  end

  namespace :admin do
    resources :users
    resources :posts
  end
end
