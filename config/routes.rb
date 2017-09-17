Rails.application.routes.draw do

  resources :authors
  get '/search', to: 'sessions#search'
  post 'search', to: 'sessions#post_search'

  resources :books
  root "books#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
