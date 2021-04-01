Rails.application.routes.draw do

  get '/projects', to: 'projects#index'
  get '/projects/:id', to: 'projects#show'
  post '/projects', to: 'projects#store'
  put '/projects/:id', to: 'projects#update'
  delete '/projects/:id', to: 'projects#destroy'

  get '/tasks', to: 'tasks#index'
  get '/tasks/:id', to: 'tasks#show'
  post '/tasks', to: 'tasks#store'
  put '/tasks/:id', to: 'tasks#update'
  delete '/tasks/:id', to: 'tasks#destroy'
end
