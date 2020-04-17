Rails.application.routes.draw do
  
  root 'sessions#welcome'
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy', method: :delete

  resources :comments
  resources :ideas do 
    resources :comments, only: [:new, :index]
  end 

  resources :types
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
