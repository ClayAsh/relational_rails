class ProjectsController < ApplicationController 
  def index 
     @projects = Project.all 
     @projects.order(:created_at)
  end

  def show 
    @project = Project.find(params[:id])
  end

end