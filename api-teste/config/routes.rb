Rails.application.routes.draw do

  get '/projects', to: 'projects#index'
  get '/projects/:id', to: 'projects#show'
  post '/projects', to: 'projects#store'
  put '/projects/:id', to: 'projects#update'
  delete '/projects/:id', to: 'projects#destroy'
end
