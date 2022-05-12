require 'rails_helper'

RSpec.describe Project, type: :model do
  let!(:project_1) {Project.create!(name:"Mural", active:false, funding:3000, created_at: 1.seconds.ago)}
  let!(:project_2) {Project.create!(name:"Community Garden", active:true, funding:4000, created_at: 10.seconds.ago)}
   
  describe "relationships" do
      it {should have_many :volunteers}
    end 

    describe "validations" do
        it { should validate_presence_of :name }
        it { should validate_presence_of :funding }
        it { should allow_value(true).for(:active) }
        it { should allow_value(false).for(:active) }
    end 

    describe " ordered by time" do 
      it 'orders projects by creation time' do 
        
        expect(Project.ordered_by_time.to_a).to eq([project_1, project_2])
      end
    end
end

