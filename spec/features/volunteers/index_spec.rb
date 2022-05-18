require 'rails_helper'

RSpec.describe 'volunteer index page' do 
  let!(:project_1) {Project.create!(name:"Food Bank", active:true, funding:8000)}
  let!(:volunteer_1) {project_1.volunteers.create!(name:"John", registered:false, hours_available:5)}
  let!(:volunteer_2) {project_1.volunteers.create!(name:"Sam", registered:true, hours_available:10)}

  it 'has links to project index' do 
		visit "/volunteers"

		click_link 'Projects'
		expect(current_path).to eq('/projects')
	end

	it 'has links to volunteer index' do 
		visit "/volunteers"

		click_link 'Volunteers'
		expect(current_path).to eq('/volunteers')
	end 

  it 'has link to delete volunteer' do 
		visit "/volunteers"

    within("##{volunteer_2.id}") do 
      click_link 'Delete Volunteer'
    end
      expect(page).to_not have_content(volunteer_2.name)
 	end

	it 'has link to update volunteer' do 
		visit "/volunteers"

    within("##{volunteer_2.id}") do 
      click_link 'Update Volunteer'

      expect(current_path).to eq("/volunteers/#{volunteer_2.id}/edit")
    end
  end

  it "shows all volunteers who are registered" do 
    visit "/volunteers"
  
    expect(page).to_not have_content(volunteer_1.name)
    expect(page).to have_content(volunteer_2.name)
  end
end