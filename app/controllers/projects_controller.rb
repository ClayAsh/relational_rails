class ProjectsController < ApplicationController 
  def index 
     @project = Project.all 
  end

  def show 
    #  require 'pry'; binding.pry
    @project = Project.find(params[:id])
  end

end