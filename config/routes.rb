Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  post '/homes/guest_sign_in', to: 'homes#new_guest'

  root to: 'homes#index'
  get 'homes/about'

  resources :users, only: [:edit, :index, :show, :update] do
    collection do
      get 'search'
    end
  end

  get '/followings_user/:id' => 'users#followings', as: 'followings_user'
  get '/followers_user/:id' => 'users#followers', as: 'followers_user'

  resources :relationships, only: [:create, :destroy]

  resources :tweets, only: [:index, :new, :create, :destroy, :show] do
    resource :claps, only: [:create, :destroy]
    resources :tweet_comments, only: [:create, :destroy]
  end

  resources :questions do
    resources :answers, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :tasks

  get   'inquiry'         => 'inquiry#index'     # 入力画面
  post  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面

  resources :study_times, only: [:index, :new, :create, :destroy, :edit, :update]
  get 'study_times/study_time' => 'study_times#study_time'
  patch 'study_times/:id' => 'study_times#update_time', as: 'update_time_study_time'

  get 'pomo_timer/long_time'
  get 'pomo_timer/short_resr'
  get 'pomo_timer/long_rest'

end
