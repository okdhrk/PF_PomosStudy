Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root to: 'homes#top'
  get 'homes/about'

  resources :users, only: [:edit, :index, :show, :update]
  get 'users/unsubscribe' => 'users#unsubscribe'

  resources :relationships, only: [:create, :destroy]
  get 'followings_user' => 'users#followings'
  get 'followers_user' => 'users#followers'

  resources :tweets, only: [:index, :new, :create, :destroy, :show] do
    resource :claps, only: [:create, :destroy]
    resources :tweet_comments, only: [:create, :destroy]
  end

  resources :questions do
    resources :answers, only: [:create, :destroy]
  end

  resources :tasks do
    resources :begin_times, only: [:create]
    resources :stop_times, only: [:create]
  end

  get   'inquiry'         => 'inquiry#index'     # 入力画面
  post  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面

end
