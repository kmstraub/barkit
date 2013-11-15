Barkit::Application.routes.draw do
 
  resources :relationships

  resources :barks

  get "sessions/new"
  post "sessions/create"
  get "sessions/destroy"
 
 resources :users
 
 root to: 'users#new'

 get 'buddies', to: 'users#buddies', as: 'buddies'
end
