require 'rails_helper'

RSpec.describe 'new project' do

	it 'has links to project index' do 
		visit "/projects/new"

		click_link 'Projects'
		expect(current_path).to eq('/projects')
	end

	it 'has links to volunteer index' do 
		visit "/projects/new"

		click_link 'Volunteers'
		expect(current_path).to eq('/volunteers')
	end 
  
  it 'can create a new project' do     
    visit '/projects/new' 
    
    fill_in 'name', with: "New project"
    fill_in 'active', with: "true"
    fill_in 'funding', with: "500"
   
    click_button 'Create Project' 

    expect(current_path).to eq('/projects')
    project = Project.last 
    expect(project.name).to eq("New project")
    expect(project.active).to eq(true)
    expect(project.funding).to eq(500)
  end 
end 