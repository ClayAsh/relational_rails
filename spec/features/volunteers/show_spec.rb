require 'rails_helper'

RSpec.describe 'volunteer show page' do 
    it 'dislays volunteer attributes' do 
    # let!(:volunteer_1) {volunteer.create!(name:"Mural", active:false, funding:3000)}
    # let!(:volunteer_2) {volunteer.create!(name:"Community Garden", active:true, funding:4000)}
    project = Project.create!(name:"Food Bank", active:true, funding:8000)
    volunteer_1 = project.volunteers.create!(name:"John", registered:false, hours_available:5)
    volunteer_2 = project.volunteers.create!(name:"Sam", registered:true, hours_available:10)
   
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