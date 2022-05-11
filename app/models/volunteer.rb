class Volunteer < ApplicationRecord
  # validates_presence_of :name, :registered, :hours_available
  belongs_to :project #, optional: true 
end
