Rails.application.routes.draw do
  resources :users, only: %i[new create]
  resources :documents, only: %i[index new create edit update destroy]

  root 'pages#index'
end
