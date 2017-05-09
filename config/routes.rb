Rails.application.routes.draw do

  devise_for :users, controllers: {
          registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks'
        }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '(:locale)', locale: /de/ do
    root to: 'pages#home'

    resources :dogs do
      member do
        post 'availability'
      end
    end
    resources :requests do
      resources :messages, only: [:create]
    end

    get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  end
end
