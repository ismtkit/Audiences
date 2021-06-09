Rails.application.routes.draw do

   root to: 'homes#top'

  scope module: 'user' do
   devise_for :users, controllers: {
      sessions: 'user/users/sessions',
      registrations: 'user/users/registrations',
      passwords: 'user/users/passwords'
    }
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
