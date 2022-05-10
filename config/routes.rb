Rails.application.routes.draw do

  get '/', to: 'welcome#index'
  get '/projects', to: 'projects#index'
  get '/projects/:id', to: "projects#show"
  
end
