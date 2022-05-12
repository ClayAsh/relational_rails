class ProjectVolunteersController < ApplicationController 

	def index
			@project = Project.find(params[:project_id])
			@volunteers = @project.volunteers
	end

	def new 
		@project = Project.find(params[:project_id])
	end

	def create 
	  project = Project.find(params[:project_id])
		volunteer = project.volunteers.new ({
			name: params[:volunteer][:name],
			registered: params[:volunteer][:registered], 
			hours_available: params[:volunteer][:hours_available]
			})
		volunteer.save 
		redirect_to "/projects/#{volunteer.project_id}/volunteers"
  end
end