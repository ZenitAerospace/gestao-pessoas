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

    after_save :attach_save
    after_update { notify_observer(text_update) }
    def attach_save
     activity_observer = ActivityObserver.find_or_create_by(user: self.user,
                                          activity: self)
     attach(activity_observer)
     notify_observer(text_save)
    end

    # Messages constants
    def text_save
      "Salva atividade: #{name}"
    end
    def text_update
      "Atividade modificada: #{name}"
    end
    private :text_save,:text_update
end
