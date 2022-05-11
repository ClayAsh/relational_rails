require 'rails_helper'

RSpec.describe Project, type: :model do
    describe "relationships" do
      it {should have_many :volunteers}
    end 

    describe "validations" do
        it { should validate_presence_of :name }
        it { should validate_presence_of :funding }
        it { should allow_value(true).for(:active) }
        it { should allow_value(false).for(:active) }
    end 
end

