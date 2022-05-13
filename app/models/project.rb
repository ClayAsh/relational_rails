class Project < ApplicationRecord
    has_many :volunteers, dependent: :destroy 

    validates_presence_of :name
    validates_presence_of :funding
    validates :active, inclusion: [true, false]

    def self.ordered_by_time
        order(created_at: :desc)
    end
end
