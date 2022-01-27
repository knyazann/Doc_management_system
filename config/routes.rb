Rails.application.routes.draw do
  resource :session, only: %i[new create destroy] # в единственном числе, чтобы при DELETE не запрашивался id
  resources :users, only: %i[new create]
  resources :documents, only: %i[index new create edit update destroy]

  root 'pages#index'
end
