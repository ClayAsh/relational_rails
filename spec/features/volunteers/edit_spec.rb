require 'rails_helper'

RSpec.describe 'update volunteer' do
  let!(:project_1) {Project.create!(name:"Mural", active:false, funding:3000)}
  let!(:volunteer_1) {project_1.volunteers.create!(name:"John", registered:false, hours_available:5)}

  it 'can update a volunteer' do     
    visit "/volunteers/#{volunteer_1.id}/edit" 
    
    fill_in 'volunteer[name]', with: "Mark"
    fill_in 'volunteer[registered]', with: "true"
    fill_in 'volunteer[hours_available]', with: "20"
		
    click_button 'Update volunteer' 
		
    expect(current_path).to eq("/volunteers/#{volunteer_1.id}")
    
    expect(page).to have_content("Mark")
    expect(page).to have_content(true)
    expect(page).to have_content(20)

    expect(page).to_not have_content("John")
    expect(page).to_not have_content("false")
    
  end 
end 