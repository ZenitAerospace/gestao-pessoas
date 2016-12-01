module ActiveRecord
    module Observator
        def notify(message)
          raise NoMethodError.new("Implement the notify method")
        end
    end
    module ObservableSubject
      extend ActiveSupport::Concern
      def attach(observer)
        init_observable
        @observers << observer
      end
      def deattach(observer)
        init_observable
        @observers.delete(observer)
        observer.destroy
      end
      def notify_observer(message)
        init_observable
        @observers.each do |observer|
            observer.notify(message)
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
