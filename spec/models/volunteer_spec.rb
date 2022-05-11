require 'rails_helper'
RSpec.describe Volunteer, type: :model do
    describe "relationships" do
      it {should belong_to :project}
    end 

    describe "validations" do
        it { should validate_presence_of :name }
        it { should validate_presence_of :hours_available }
        it { should allow_value(true).for(:registered) }
        it { should allow_value(false).for(:registered) }
    end 
end