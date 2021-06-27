Rails.application.routes.draw do
  devise_for :users,controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
    }

  root 'user/homes#top'

# ユーザー

  scope module: 'user' do
    root to: 'homes#top'
    resources :users,  only: [:index, :show, :edit, :update] do
      resource :follows, only: [:create, :destroy]
      get 'followings' => 'follows#followings', as: 'followings'
      get 'followers' => 'follows#followers', as: 'followers'
      get :favorites, on: :collection
      get :search, on: :collection
    end
    resources :movies, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
      resources :movie_reviews, only: [:create, :destroy]
    end
    get 'search' => 'movies#search'

  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  namespace :admin do
 resources :movie_reviews, only: [:index, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
