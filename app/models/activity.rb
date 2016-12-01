class Activity < ActiveRecord::Base
    alias_attribute :observers, :activity_observers
	# All fields are necessary, except description and status.
	validates :name, presence: true
	validates :begin_date, presence: true
	validates :end_date, presence: true

    belongs_to :user
    belongs_to :project
    has_many :activity_observers
    
end
