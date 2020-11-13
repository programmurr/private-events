Rails.application.routes.draw do
  resources :users, only: %i[index new create show destroy]
  root 'users#index'
end
