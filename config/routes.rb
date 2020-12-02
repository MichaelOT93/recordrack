Rails.application.routes.draw do
  resources :genres
  get 'cart/index'
  get 'sessions/new'
  resources :records
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 root 'static_pages#home'

  get  '/home' => 'static_pages#home'

  get '/search' => 'records#search'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'

  get '/users' => 'users#index'
  
  get 'genre/:title' => 'static_pages#genre'

  get 'users/:id/dashboard', to: 'dashboard#show', as: 'dashboard'



  resources :line_items
  resources :carts


  resources :users
  resources :records, only: [:create, :destroy]
  
end
