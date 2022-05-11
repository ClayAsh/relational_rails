class ProjectVolunteersController < ApplicationController 

    def index
        @project = Project.find(params[:project_id])
        @volunteers = @project.volunteers
    end
end