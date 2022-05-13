require 'rails_helper'

RSpec.describe 'volunteer show page' do 
  let!(:project_1) {Project.create!(name:"Food Bank", active:true, funding:8000)}
  let!(:volunteer_1) {project_1.volunteers.create!(name:"John", registered:false, hours_available:5)}
  let!(:volunteer_2) {Volunteer.create!(name:"Sam", registered:true, hours_available:10, project_id:project_1.id)}

  it 'has link to project index' do 

    visit "/volunteers"

    click_link 'Projects'
    expect(current_path).to eq('/projects')

    click_link 'Volunteers'
		expect(current_path).to eq('/volunteers')
  end 

  it "shows all volunteers who are registered" do 
    
    visit "/volunteers"
  
    expect(page).to_not have_content(volunteer_1.name)
    expect(page).to have_content(volunteer_2.name)
  end
end