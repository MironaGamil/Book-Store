Rails.application.routes.draw do

  get 'sessions/login'

  resources :authors
  get '/search', to: 'sessions#search'
  post 'search', to: 'sessions#post_search'

  get '/login', to: 'sessions#login'
  post 'login', to: 'sessions#post_login'
  delete '/logout',  to: 'sessions#destroy'

  resources :books
  root "books#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
