Rails.application.routes.draw do

  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: 'homes#top'

  resources :post_images, only: [:new,:create,:index,:show,:destroy] do
    #いいねは１投稿につき１回だから単数でいい
    resource :favorites, only:[:create, :destroy]
    #１投稿に対して複数コメントしていいから複数形にしておく
    resources :post_comments, only: [:create, :destroy]
  end
  
  resources :users, only:[:show, :edit, :update]

  get 'homes/about' =>  'homes#about',as:'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
