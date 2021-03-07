Rails.application.routes.draw do

  get 'tweets/index'
  get 'tweets/new'
  get 'tweets/show'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root to: 'homes#top'
  get 'homes/about'

  resources :users, only: [:edit, :index, :show, :update]
  get 'users/unsubscribe' => 'users#unsubscribe'

  resources :relationships, only: [:create, :destroy,]
  get 'followings_user' => 'users#followings'
  get 'followers_user' => 'users#followers'

end
