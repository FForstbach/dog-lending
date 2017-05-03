Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '(:locale)', locale: /de/ do
    root to: 'pages#home'
      resources :users do
        resources :messages, only: [:index, :new, :create]
      end
    resources :dogs_path
    get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  end
end
