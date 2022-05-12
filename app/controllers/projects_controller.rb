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
    project = Project.new ({
      name: params[:project][:name],
      active: params[:project][:active], 
      funding: params[:project][:funding]
    })
    project.save 

    redirect_to '/projects'
  end

end