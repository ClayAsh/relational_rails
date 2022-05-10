class ProjectsController < ApplicationController 
  def index 
    @projects = Projects.all 
  end

  def show 
    require 'pry'; binding.pry
    @projects = Projects.find(params[:id])
  end

end