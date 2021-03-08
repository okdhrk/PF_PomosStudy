Rails.application.routes.draw do

  get 'questions/index'
  get 'questions/show'
  get 'questions/new'
  get 'questions/create'
  get 'questions/edit'
  get 'questions/update'
  get 'questions/destroy'
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
    resource :claps, only: [:create, :destroy]
    resources :tweet_comments, only: [:create, :destroy]
  end

  resources :questions

end
