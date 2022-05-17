require 'rails_helper'

RSpec.describe 'project index page' do 
  let!(:project_1) {Project.create!(name:"Mural", active:false, funding:3000)}
  let!(:project_2) {Project.create!(name:"Community Garden", active:true, funding:4000)}

	it 'has links to project index' do 
		visit "/projects"

		click_link 'Projects'
		expect(current_path).to eq('/projects')
	end

	it 'has links to volunteer index' do 
		visit "/projects"

		click_link 'Volunteers'
		expect(current_path).to eq('/volunteers')
	end 

	it 'has links to project 2 show page' do 
		visit "/projects"
    
    within('#project-0') do 
    	click_link 'Community Garden'
  	  expect(current_path).to eq("/projects/#{project_2.id}")
 		end
	end 

	it 'has links to project 1 show page' do 
		visit "/projects"
    
    within('#project-1') do 
    	click_link 'Mural'
  	  expect(current_path).to eq("/projects/#{project_1.id}")
 		end
	end 

  it 'has link to update project 1' do 
    visit "/projects"
    
    within('#project-0') do 
    	click_link 'Update Project'
  	  expect(current_path).to eq("/projects/#{project_2.id}/edit")
 		end
	end 
   
	it 'has link to update project 2' do 
    visit "/projects"

		within('#project-1') do 
			click_link 'Update Project'
			expect(current_path).to eq("/projects/#{project_1.id}/edit")
		end
  end

  it 'has link to delete project 2' do 
    visit "/projects"

  	within('#project-0') do 
    click_link 'Delete Project'

    expect(page).to_not have_content(project_2.name)
    end
  end

  it "shows all projects" do 
    visit "/projects"

    within('#project-0') do 
      expect(page).to have_content(project_2.name)
      expect(page).to have_content(project_2.created_at)
    end 
  
    within('#project-1') do 
      expect(page).to have_content(project_1.name)
      expect(page).to have_content(project_1.created_at)
    end 
  end
end