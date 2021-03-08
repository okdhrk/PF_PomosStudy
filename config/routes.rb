Rails.application.routes.draw do

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

  resources :tweets, only: [:index, :new, :create, :destroy, :show] do
    resource :favorites, only: [:create, :destroy]
    resources :tweet_comments, only: [:create, :destroy]
  end

end
