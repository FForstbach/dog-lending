Rails.application.routes.draw do
  get 'messages/index'

  get 'messages/new'

  get 'messages/create'

  get 'dogs/index'

  get 'dogs/new'

  get 'dogs/create'

  get 'dogs/edit'

  get 'dogs/update'

  get 'dogs/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
