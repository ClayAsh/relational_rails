require 'rails_helper'

RSpec.describe 'volunteer show page' do 
	let!(:project_1) {Project.create!(name:"Food Bank", active:true, funding:8000)}
	let!(:volunteer_1) {project_1.volunteers.create!(name:"John", registered:false, hours_available:5)}
	let!(:volunteer_2) {project_1.volunteers.create!(name:"Sam", registered:true, hours_available:10)}
	
	it 'has links to project index' do 
		visit "/volunteers/#{volunteer_1.id}"

		click_link 'Projects'
		expect(current_path).to eq('/projects')
	end

	it 'has links to volunteer index' do 
		visit "/volunteers/#{volunteer_1.id}"

		click_link 'Volunteers'
		expect(current_path).to eq('/volunteers')
	end 

	it 'has link to delete volunteer' do 
		visit "/volunteers/#{volunteer_1.id}"

		click_link 'Delete Volunteer'
		expect(page).to_not have_content(volunteer_1.name)
 	end

	it 'has link to update volunteer' do 
		visit "/volunteers/#{volunteer_1.id}"

		click_link 'Update Volunteer'
		expect(page).to_not have_content(volunteer_1.name)
  end

	it 'dislays volunteer attributes' do 
			
		visit "/volunteers/#{volunteer_1.id}"

		expect(page).to have_content(volunteer_1.name)
		expect(page).to have_content(volunteer_1.registered)
		expect(page).to have_content(volunteer_1.hours_available)
		expect(page).to have_content(volunteer_1.created_at)
		expect(page).to have_content(volunteer_1.updated_at)
		expect(page).to_not have_content(volunteer_2.name)
	end

end