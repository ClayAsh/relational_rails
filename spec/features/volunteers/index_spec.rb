require 'rails_helper'

RSpec.describe 'volunteer show page' do 
  let!(:project_1) {Project.create!(name:"Food Bank", active:true, funding:8000)}
  let!(:volunteer_1) {project_1.volunteers.create!(name:"John", registered:false, hours_available:5)}
  let!(:volunteer_2) {Volunteer.create!(name:"Sam", registered:true, hours_available:10, project_id:project_1.id)}

it "shows all volunteers" do 
  
    visit "/volunteers"
   
    expect(page).to have_content(volunteer_1.name)
    expect(page).to have_content(volunteer_2.name)
  end
end