require 'rails_helper'

RSpec.describe 'project show page' do 
  let!(:project_1) {Project.create!(name:"Mural", active:false, funding:3000)}
  let!(:project_2) {Project.create!(name:"Community Garden", active:true, funding:4000)}

  it "shows all projects" do 
    visit "/projects"
    save_and_open_page
    expect(page).to have_content(project_1.name)
    expect(page).to have_content(project_2.name)

  end
end