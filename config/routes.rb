Rails.application.routes.draw do
  devise_for :users, controllers: {
          registrations: 'users/registrations'
        }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '(:locale)', locale: /de/ do
    root to: 'pages#home'
      namespace :users do
        resources :messages, only: [:index, :new, :create]
      end
    resources :dogs do
      member do
        post 'availability'
      end
    end
    get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  end
end
