Rails.application.routes.draw do
  root 'sessions#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  resources :blogs, only: [:index]

  namespace :api do
    get 'blogs/index', to: 'blogs#index'
    get 'users/create', to: 'users#create'
    get 'sessions/create', to: 'sessions#create'
    post 'login', to: 'sessions#create'
    post 'signup', to: 'users#create'
  end
end
