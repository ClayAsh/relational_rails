class Volunteer < ApplicationRecord
  belongs_to :project 

    validates_presence_of :name
    validates_presence_of :hours_available
    validates :registered, inclusion: [true, false]

  def self.only_true
    where(registered: true)
  end

  def self.sort_alphabeticaly 
    order(:name)
  end

end
