class Volunteer < ApplicationRecord
  belongs_to :project 

    validates_presence_of :name
    validates_presence_of :hours_available
    validates :registered, inclusion: [true, false]

end
