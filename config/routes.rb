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
    end
    resources :movies, only: [:index, :show]

  end

  namespace :admin do
    devise_for :admins, controllers: {
      sessions: 'client/admins/sessions',
      registrations: 'client/admins/registrations',
      passwords: 'client/admins/passwords'
    }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
