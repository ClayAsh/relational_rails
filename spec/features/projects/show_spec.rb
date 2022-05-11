require 'rails_helper'

RSpec.describe 'project show page' do 
    let!(:project_1) {Project.create!(name:"Mural", active:false, funding:3000)}
    let!(:project_2) {Project.create!(name:"Community Garden", active:true, funding:4000)}

    it 'dislays project attributes' do 
      visit "/projects/#{project_1.id}"
      expect(page).to have_content(project_1.name)
      expect(page).to have_content(project_1.active)
      expect(page).to have_content(project_1.funding)
      expect(page).to have_content(project_1.created_at)
      expect(page).to have_content(project_1.updated_at)
      expect(page).to_not have_content(project_2.name)
      expect(page).to_not have_content(project_2.active)
      expect(page).to_not have_content(project_2.funding)
    end
end
