Rails.application.routes.draw do
  resource :session, only: %i[new create destroy] # в единственном числе, чтобы при DELETE не запрашивался id
  resources :users, only: %i[index new create]
  resources :goals do
    resources :tasks, only: %i[create destroy]
  end
  resources :documents do
    resources :routes, only: %i[create show destroy]
  end
  resources :steps, only: %i[create]
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'

  #get "/:goal_id/tasks/new", to: 'tasks#new', as: 'goal_new_task'  

  root 'pages#index'
end
