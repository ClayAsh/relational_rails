Rails.application.routes.draw do

  get '/', to: 'welcome#index'

  get '/projects', to: 'projects#index'
  get '/projects/new', to: 'projects#new'
  post '/projects', to: 'projects#create'
  get 'projects/:id/edit', to: 'projects#edit'
  patch 'projects/:id', to: 'projects#update'
  get '/projects/:id', to: 'projects#show'

  get '/volunteers', to: 'volunteers#index'
  get '/volunteers/:id', to: 'volunteers#show'
  get 'volunteers/:id/edit', to: 'volunteers#edit'
  patch '/volunteers/:id', to: 'volunteers#update'
 
  get '/projects/:project_id/volunteers', to: 'project_volunteers#index'
  get '/projects/:project_id/volunteers/new', to: 'project_volunteers#new'
  post '/projects/:project_id/volunteers', to: 'project_volunteers#create'

end
