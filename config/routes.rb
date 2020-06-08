Rails.application.routes.draw do
  resources :notes
  resources :books
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end


root 'users#home'
get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

end

  

  # get '/auth/facebook/callback', to: "sessions#fb_create"