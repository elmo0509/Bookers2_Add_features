Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get 'search' => 'searches#search'
  
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only:[:create, :destroy]
    get :follower, on: :member
    get :followed, on: :member
  end
  
  resources :books do
    resource :favorites, only:[:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  end
end