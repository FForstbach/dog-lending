Rails.application.routes.draw do

  devise_for :users, controllers: {
          registrations: 'users/registrations'
        }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '(:locale)', locale: /de/ do
    root to: 'pages#home'
    namespace :users do
    end
    resources :dogs
    resources :requests do
      resources :messages, only: [:create]
    end

    get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  end
end
