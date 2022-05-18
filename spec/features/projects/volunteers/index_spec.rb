require 'rails_helper'

RSpec.describe "project volunteer index page" do 
	let!(:project_1) {Project.create!(name:"Food Bank", active:true, funding:8000)}
	let!(:volunteer_1) {project_1.volunteers.create!(name:"John", registered:false, hours_available:5)}
	let!(:volunteer_2) {project_1.volunteers.create!(name:"Sam", registered:true, hours_available:10)}
	
	it 'has links to project index' do 
		visit "/projects/#{project_1.id}/volunteers"

		click_link 'Projects'
		expect(current_path).to eq('/projects')
	end

	it 'has links to volunteer index' do 
		visit "/projects/#{project_1.id}/volunteers"

		click_link 'Volunteers'
		expect(current_path).to eq('/volunteers')
	end 

	it 'has link to new volunteer' do 
		visit "/projects/#{project_1.id}/volunteers"

		click_link 'Sign Up to Volunteer for this Project!'
		expect(current_path).to eq("/projects/#{project_1.id}/volunteers/new")
	end 

	it 'has link to sort volunteers alphabetically' do 
		visit "/projects/#{project_1.id}/volunteers"

		click_link 'Sort Volunteers Alphabetically'
		
		expect(current_path).to eq("/projects/#{project_1.id}/volunteers")
		expect("John").to appear_before("Sam")
		expect("Sam").to_not appear_before("John")
	end 

	it 'has form to filter by hours available' do 
		visit "/projects/#{project_1.id}/volunteers"

		fill_in 'threshold', with: '10'
		click_button 'Sort by Available Hours'

		expect(current_path).to eq("/projects/#{project_1.id}/volunteers")
		expect(page).to have_content("Sam")
		expect(page).to_not have_content("John")
	end

	it "shows volunteers of project" do 
		visit "/projects/#{project_1.id}/volunteers"

		within("##{volunteer_1.id}") do
			expect(page).to have_content("John")
			expect(page).to have_content(5)
			expect(page).to have_content(false)
		end 

		within("##{volunteer_2.id}") do
			expect(page).to have_content("Sam")
			expect(page).to have_content(10)
			expect(page).to have_content(true)
		end 
	end 
end 
