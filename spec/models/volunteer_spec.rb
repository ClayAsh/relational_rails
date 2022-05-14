require 'rails_helper'
RSpec.describe Volunteer, type: :model do
  let!(:project_1) {Project.create!(name:"Mural", active:false, funding:3000, created_at: 1.seconds.ago)}
  let!(:volunteer_1) {project_1.volunteers.create!(name:"John", registered:false, hours_available:5)}
	let!(:volunteer_2) {project_1.volunteers.create!(name:"Sam", registered:true, hours_available:10)}

  describe "relationships" do
    it {should belong_to :project}
  end 

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :hours_available }
    it { should allow_value(true).for(:registered) }
    it { should allow_value(false).for(:registered) }
  end 

  describe "only true" do 
    it 'returns only volunteers where registered is true' do 

    expect(Volunteer.only_true.to_a).to eq([volunteer_2])
    expect(Volunteer.only_true.to_a).to_not eq([volunteer_1])
    end
  end

  describe "sort alphabetically" do 
    it 'sorts all volunteers alphabetically' do 

    expect(Volunteer.sort_alphabeticaly.to_a).to eq([volunteer_1, volunteer_2])
    expect(Volunteer.sort_alphabeticaly.to_a).to_not eq([volunteer_1])
    end
  end

  describe "available hours above" do 
    it "filters volunteers by available hours through user input" do 

    expect(Volunteer.available_hours_above(10).to_a).to eq([volunteer_2]) 
    expect(Volunteer.available_hours_above(10).to_a).to_not eq([volunteer_1])
    end
  end
end