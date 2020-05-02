Rails.application.routes.draw do
 
  resources :users, except: [:new]
  get '/recipes/desc', to:'recipes#desc', as:'desc'
  resources :recipes do
    member do
      post :search
      #get :desc
    end
    resources :comments
    #resources :comments #, except: [:destroy]
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
