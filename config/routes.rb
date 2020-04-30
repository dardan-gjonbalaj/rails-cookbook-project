Rails.application.routes.draw do
  resources :comments
  resources :users, except: [:new]
  resources :recipes do
    member do
      post :search
    end
    resources :comments #, except: [:destroy]
   # post '/comments' => 'comments#create'
  end
  resources :comments, only: [:destroy]
  resources :ingredients
 
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
