Rails.application.routes.draw do
  resources :users, except: [:new]
  resources :recipes do
    member do
      post :search
    end
  end
  resources :ingredients
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  
  
  # get '/login' => 'sessions#new'
  # #post '/login' => 'sessions#create'
  # delete '/logout' => 'sessions#destroy'
   get '/auth/:provider/callback', to: 'sessions#create'
    get '/auth/github', to: 'sessions#create'
  

  # get '/signup' => 'users#new'
  # post '/users' => 'users#create'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
