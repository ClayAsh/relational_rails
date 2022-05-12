require 'rails_helper'

RSpec.describe 'project index page' do 
  let!(:project_1) {Project.create!(name:"Mural", active:false, funding:3000)}
  let!(:project_2) {Project.create!(name:"Community Garden", active:true, funding:4000)}

  it 'has link to volunteer index' do 
    visit "/projects"

    click_link 'Volunteers'
    expect(current_path).to eq('/volunteers')
  end 

  it "shows all projects" do 
    visit "/projects"

    within('#project-0') do 
      expect(page).to have_content(project_1.name)
      expect(page).to have_content(project_1.created_at)
    end 
  
    within('#project-1') do 
      expect(page).to have_content(project_2.name)
      expect(page).to have_content(project_2.created_at)
    end 
  end
end