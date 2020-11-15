Rails.application.routes.draw do
  resources :users, only: %i[index new create show]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root 'users#index'
end
