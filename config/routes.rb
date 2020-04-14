Rails.application.routes.draw do
  
  resources :comments
  root 'sessions#welcome'
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy', method: :delete
  
  resources :users
  resources :ideas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
