Rails.application.routes.draw do

  get 'posts/index'

  get 'posts/show'

  devise_for :users
    
  root to: 'posts#index'

  resources :posts, only:[:index, :show] do
    resources :comments
  end

  namespace :admin do
    resources :users
    resources :posts do
      post 'recommend' => 'posts#set_recommend'
      post 'unrecommend' => 'posts#set_unrecommend'
    end
  end

end
