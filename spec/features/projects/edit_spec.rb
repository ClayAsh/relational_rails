require 'rails_helper'

RSpec.describe 'update project page' do
  let!(:project_1) {Project.create!(name:"Mural", active:false, funding:3000)}
    
  it 'can update a project' do     
    visit "/projects/#{project_1.id}/edit" 
    
    fill_in 'project[name]', with: "Dancing Workshop"
    fill_in 'project[active]', with: "true"
    fill_in 'project[funding]', with: "500"
		
    click_button 'Update Project' 
		
    expect(current_path).to eq("/projects/#{project_1.id}")
    
    expect(page).to have_content("Dancing Workshop")
    expect(page).to have_content(true)
    expect(page).to have_content(500)

    expect(page).to_not have_content("Mural")
    expect(page).to_not have_content("false")
    expect(page).to_not have_content("3000")
  end 
end 