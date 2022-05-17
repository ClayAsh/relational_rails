class VolunteersController < ApplicationController 
  
  def index 
    @volunteers = Volunteer.only_true
    #  @volunteers = Volunteer.all 
  end

  def show 
    @volunteer = Volunteer.find(params[:id])
  end

  def edit 
    @volunteer = Volunteer.find(params[:id])
  end

  def update 
    volunteer = Volunteer.find(params[:id])
    volunteer.update(volunteer_params)
    redirect_to "/volunteers/#{volunteer.id}"
  end

  def destroy
    Volunteer.destroy(params[:id])
    redirect_to '/volunteers'
  end

  private 

    def volunteer_params
      params.permit(:name, :registered, :hours_available)
    end

end