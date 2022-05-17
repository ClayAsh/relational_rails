class ProjectsController < ApplicationController 
  
  def index 
     @projects = Project.ordered_by_time
  end
 
  def show 
    @project = Project.find(params[:id])
  end
  
  def new   
  end

  def create 
    Project.create(project_params)
    redirect_to '/projects'
  end

  def edit 
    @project = Project.find(params[:id])
  end

  def update 
    project = Project.find(params[:id])
    project.update(project_params)
    redirect_to "/projects/#{project.id}"
  end

  def destroy
    Project.destroy(params[:id])
    redirect_to '/projects'
  end

  private 

    def project_params
      params.permit(:name, :active, :funding)
    end

end