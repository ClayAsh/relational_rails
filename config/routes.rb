Rails.application.routes.draw do

  get '/', to: 'welcome#index'

  get '/projects', to: 'projects#index'
  get '/projects/:id', to: 'projects#show'
  get '/projects/new', to: 'projects#new'

  get '/volunteers', to: 'volunteers#index'
  get '/volunteers/:id', to: 'volunteers#show'

  get '/projects/:project_id/volunteers', to: 'project_volunteers#index'
end
