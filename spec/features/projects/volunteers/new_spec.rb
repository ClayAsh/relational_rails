require 'rails_helper'

RSpec.describe 'new volunteer page' do
  let!(:project_1) {Project.create!(name:"Food Bank", active:true, funding:8000)}
 
  it 'can create a new volunteer' do     
    visit "/projects/#{project_1.id}/volunteers/new" 
    
    fill_in 'volunteer[name]', with: "Betty"
    fill_in 'volunteer[registered]', with: "false"
    fill_in 'volunteer[hours_available]', with: "5"
   
    click_button 'Create Volunteer' 

    expect(current_path).to eq("/projects/#{project_1.id}/volunteers")
    volunteer = Volunteer.last 
    expect(volunteer.name).to eq("Betty")
    expect(volunteer.registered).to eq(false)
    expect(volunteer.hours_available).to eq(5)
  end 
end 