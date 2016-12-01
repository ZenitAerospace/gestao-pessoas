require 'observer/base'
class Activity < ActiveRecord::Base
    include ActiveRecord::ObservableSubject

    alias_attribute :observers, :activity_observers
	# All fields are necessary, except description and status.
	validates :name, presence: true
	validates :begin_date, presence: true
	validates :end_date, presence: true

    belongs_to :user
    belongs_to :project
    has_many :activity_observers
    
    # Observer callbacks
    after_save { notify_observer(text_save) }
    after_update { notify_observer(text_update) }
    # Messages constants
    def text_save
      "Saved a new activity: #{name}"
    end
    def text_update
      "Changed the activity: #{name}"
    end
    private :text_save,:text_update
end
