Rails.application.routes.draw do

  get '/', to: 'welcome#index'

  get '/projects', to: 'projects#index'
  get '/projects/new', to: 'projects#new'
  get '/projects/:id', to: 'projects#show'
  post '/projects', to: 'projects#create'

  get '/volunteers', to: 'volunteers#index'
  get '/volunteers/:id', to: 'volunteers#show'

  get '/projects/:project_id/volunteers', to: 'project_volunteers#index'
end
