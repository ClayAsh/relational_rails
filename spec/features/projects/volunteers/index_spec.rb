require 'rails_helper'

RSpec.describe "project volunteer index page" do 
	let!(:project_1) {Project.create!(name:"Food Bank", active:true, funding:8000)}
	let!(:volunteer_1) {project_1.volunteers.create!(name:"John", registered:false, hours_available:5)}
	let!(:volunteer_2) {project_1.volunteers.create!(name:"Sam", registered:true, hours_available:10)}
	
	it "shows volunteers of project" do 
	
		visit "/projects/#{project_1.id}/volunteers"
		
		within('#volunteer-0') do
			expect(page).to have_content("John")
			expect(page).to have_content(5)
			expect(page).to have_content(false)
		 end 

		 within('#volunteer-1') do
			expect(page).to have_content("Sam")
			expect(page).to have_content(10)
			expect(page).to have_content(true)
		 end 
	end
end