module Resque
  module Plugins
    module ThrottledJob
      def self.included(base)
        base.class_eval do
          include Resque::Plugins::UniqueJob
          extend ClassMethods

          @__is_throttled_job = true
          @throttle_window = nil
        end
      end

      module ClassMethods
        def before_reserve_resque_throttle *args
          if args.length > 1 &&
             args[0].is_a?(Fixnum)
            args[0] < Time.now.to_i
          else
            true
          end
        end

        def throttled_enqueue *args
          throttle_window =
            instance_variable_get(:@throttle_window) ||
            (respond_to?(:throttle_window) && klass.throttle_window)
          if throttle_window && !Resque.inline?
            target_time = (Time.now.to_i / throttle_window + 1) * throttle_window
          else
            target_time = nil
          end
          Resque.enqueue self, target_time, *args
        end
      end
    end
  end
end
