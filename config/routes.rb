Rails.application.routes.draw do
  resource :session, only: %i[new create destroy] # в единственном числе, чтобы при DELETE не запрашивался id
  resources :users, only: %i[index new create]
  resources :goals do
    resources :tasks, only: %i[create destroy]
  end
  get "/routes/:id", to: 'routes#show', as: 'route'  

  resources :documents do
    resources :routes, only: %i[new create destroy show]
  end

  resources :routes, only: %i[new create destroy show] do
    resources :steps, only: %i[create show]
  end 
  
  
   
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'

  root 'pages#index'
end
