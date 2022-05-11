class Project < ApplicationRecord
    has_many :volunteers 

    validates_presence_of :name
    validates_presence_of :funding
    validates :active, inclusion: [true, false]
end
