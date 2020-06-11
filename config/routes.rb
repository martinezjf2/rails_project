Rails.application.routes.draw do
  
  # resources :users do
  #   resources :books do
  #     resources :notes
  #   end
  # end
  
  # resources :users
  # resources :books

  resources :users
  resources :notes
  resources :books


  resources :users do
    resources :books
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end


root 'users#home'
get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy' #is this correct?
  # post '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback', to: "sessions#fb_create"
  post '/books/new' => "books#create"
  

end

  
