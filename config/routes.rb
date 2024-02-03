Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "homes/about", to: "homes#about", as: "about"
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy] 
    #コメントは投稿画像に対してコメントされ、post_commentsは post_imagesに結びつき親子関係になる
  end
  resources :users, only: [:show, :edit, :update]
  #get 'post_image/new'
  #get 'post_image/index'
  #get 'post_image/show'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
