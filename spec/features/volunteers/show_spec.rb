require 'rails_helper'

RSpec.describe 'volunteer show page' do 
	let!(:project_1) {Project.create!(name:"Food Bank", active:true, funding:8000)}
	let!(:volunteer_1) {project_1.volunteers.create!(name:"John", registered:false, hours_available:5)}
	let!(:volunteer_2) {project_1.volunteers.create!(name:"Sam", registered:true, hours_available:10)}
	
	it 'dislays volunteer attributes' do 
			
		visit "/volunteers/#{volunteer_1.id}"

		expect(page).to have_content(volunteer_1.name)
		expect(page).to have_content(volunteer_1.registered)
		expect(page).to have_content(volunteer_1.hours_available)
		expect(page).to have_content(volunteer_1.created_at)
		expect(page).to have_content(volunteer_1.updated_at)
		expect(page).to_not have_content(volunteer_2.name)
		expect(page).to_not have_content(volunteer_2.registered)
		expect(page).to_not have_content(volunteer_2.hours_available)
	end

end