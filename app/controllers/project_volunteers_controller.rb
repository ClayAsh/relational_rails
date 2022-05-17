class ProjectVolunteersController < ApplicationController 

	def index
			@project = Project.find(params[:project_id])
		if params[:sort]
			@volunteers = @project.volunteers.sort_alphabeticaly
		elsif params[:threshold]
			@volunteers = @project.volunteers.available_hours_above(params[:threshold])
		else 
			@volunteers = @project.volunteers
		end
	end

	def new 
		@project = Project.find(params[:project_id])
	end

	def create 
	  project = Project.find(params[:project_id])
		volunteer = project.volunteers.create(volunteer_params)
		redirect_to "/projects/#{volunteer.project_id}/volunteers"
  end

		private

			def volunteer_params
				params.permit(:name, :registered, :hours_available)
			end

end
