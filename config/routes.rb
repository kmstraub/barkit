Barkit::Application.routes.draw do
 
  resources :barks

  get "sessions/new"
  post "sessions/create"
  get "sessions/destroy"
 
 resources :users
 
 root to: 'users#new'
end
