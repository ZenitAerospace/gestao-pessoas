module ActiveRecord
    module Observator
        def notify(message)
          raise NoMethodError.new("Implement the notify method")
        end
    end
    module Observable
        extend ActiveSupport::Concern
        class_methods do
          def attach(observer)
            init_observable
            @observers << observer
            # TODO: remove the attribute of user
            self.user.activity_observers << observer
          end
          def deattach(observer)
            init_observable
            @observers.delete(observer)
            observer.destroy
          end
          def notifyObserver(message)
            init_observable
            @observers.each do |observer|
                observer.notify(message)
            end
          end
        end
        def init_observable
          if self.is_a? ActiveRecord::Base
            # TODO: change the observers alias to class name based
            @observers = self.observers unless defined? @observer
          end
        end
        private :init_observable
    end
end
