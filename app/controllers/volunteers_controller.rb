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
    volunteer.update ({
      name: params[:volunteer][:name],
      registered: params[:volunteer][:registered], 
      hours_available: params[:volunteer][:hours_available]
      })

    volunteer.save 
    redirect_to "/volunteers/#{volunteer.id}"
  end

   def destroy
    Volunteer.destroy(params[:id])
    redirect_to '/volunteers'
  end

end