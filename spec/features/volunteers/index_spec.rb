require 'rails_helper'

RSpec.describe 'volunteer show page' do 
#   let!(:project_1) {Project.create!(name:"Food Bank", active:true, funding:8000)}
#   let!(:volunteer_1) {Volunteer.create!(name:"John", registered:false, hours_available:5)}
#   let!(:volunteer_2) {Volunteer.create!(name:"Sam", registered:true, hours_available:10)}

it "shows all volunteers" do 
    project = Project.create!(name:"Food Bank", active:true, funding:8000)
    volunteer_1 = project.volunteers.create!(name:"John", registered:false, hours_available:5)
    volunteer_2 = project.volunteers.create!(name:"Sam", registered:true, hours_available:10)
    visit "/volunteers"
    # save_and_open_page
    expect(page).to have_content(volunteer_1.name)
    expect(page).to have_content(volunteer_2.name)
  end
end