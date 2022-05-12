class ProjectsController < ApplicationController 
  def index 
     @projects = Project.ordered_by_time
  end

  def show 
    @project = Project.find(params[:id])
  end

  def new 
    
  end

end