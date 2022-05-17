require 'rails_helper'

RSpec.describe 'new volunteer page' do
  let!(:project_1) {Project.create!(name:"Food Bank", active:true, funding:8000)}
 
	it 'has links to project index' do 
		visit "/projects/#{project_1.id}/volunteers/new"

		click_link 'Projects'
		expect(current_path).to eq('/projects')
	end

	it 'has links to volunteer index' do 
		visit "/projects/#{project_1.id}/volunteers/new"

		click_link 'Volunteers'
		expect(current_path).to eq('/volunteers')
	end 
  
  it 'can create a new volunteer' do     
    visit "/projects/#{project_1.id}/volunteers/new" 
    
    fill_in 'name', with: "Betty"
    fill_in 'registered', with: "false"
    fill_in 'hours_available', with: "5"
   
    click_button 'Create Volunteer' 

    expect(current_path).to eq("/projects/#{project_1.id}/volunteers")
    volunteer = Volunteer.last 
    expect(volunteer.name).to eq("Betty")
    expect(volunteer.registered).to eq(false)
    expect(volunteer.hours_available).to eq(5)
  end 
end 