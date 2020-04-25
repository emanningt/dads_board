Rails.application.routes.draw do
  
  root 'sessions#welcome'
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  post '/users/:id' => 'users#show'

  get '/logout' => 'sessions#destroy', method: :delete

  get '/auth/:provider/callback' => 'sessions#create'

  resources :comments
  resources :ideas do 
    resources :comments, only: [:new, :index, :show]
  end 

  resources :types
  resources :users, only: [:new, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
