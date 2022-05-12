require 'rails_helper'

RSpec.describe 'new project page' do
  it 'can create a new project' do     
    visit '/projects/new' 
    save_and_open_page
    fill_in 'project[name]', with: "New project"
    fill_in 'project[active]', with: "true"
    fill_in 'project[funding]', with: "500"
   
    click_button 'Create Project' 

    expect(current_path).to eq('/projects')
    project = Project.last 
    expect(project.name).to eq("New project")
    expect(project.active).to eq(true)
    expect(project.funding).to eq(500)
  end 
end 