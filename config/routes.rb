Rails.application.routes.draw do
  get 'sessions/new'
  resources :records
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 root 'static_pages#home'

  get  '/home' => 'static_pages#home'

  post '/search' => 'records#search'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'

  get '/users' => 'users#index'

  




  resources :users
  
end
