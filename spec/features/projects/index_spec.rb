require 'rails_helper'

RSpec.describe 'project show page' do 
  let!(:project_1) {Project.create!(name:"Mural", active:false, funding:3000)}
  let!(:project_2) {Project.create!(name:"Community Garden", active:true, funding:4000)}

  it "shows all projects" do 
    visit "/projects"

    within('#project-0') do 
      expect(page).to have_content("Mural")
      expect(page).to have_content(project_1.name)
    end 
  
    within('#project-1') do 
      expect(page).to have_content("Community Garden")
      expect(page).to have_content(project_2.name)
    end 
  end
end