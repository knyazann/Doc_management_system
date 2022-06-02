Rails.application.routes.draw do
  resource :session, only: %i[new create destroy] # в единственном числе, чтобы при DELETE не запрашивался id
  resources :users
  resources :goals, only: %i[new create destroy show] do
    resources :tasks, only: %i[create destroy]
  end
  resources :handbooks, only: %i[index] 

  get '/departments', to: 'handbooks#departments_link', as: 'departments_link'

  get '/my_documents', to: 'documents#my_documents', as: 'my_documents'

  #get "/routes/:id", to: 'routes#show', as: 'route'  
  get "/goals_inbox", to: 'goals#index_inbox', as: 'inbox_goals' 
  get "/goals_outbox", to: 'goals#index_outbox', as: 'outbox_goals' 

  resources :documents do
    resources :routes, only: %i[new create destroy show]
  end

  resources :routes, only: %i[new create destroy show] do
    resources :steps, only: %i[create show]
  end 
  
  
   
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'

  root 'pages#index'
end
