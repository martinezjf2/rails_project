Rails.application.routes.draw do
  

  resources :users
  resources :notes
  resources :books


  resources :books do
    resources :notes
  end

root 'users#home'
get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy' 
delete '/logout', to: 'sessions#destroy'
get '/auth/facebook/callback', to: "sessions#fb_create"
post '/books/new' => "books#create"
  

end