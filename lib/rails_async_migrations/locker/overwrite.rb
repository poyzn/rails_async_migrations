# overwrites the locked methods with some logic
# this may turn the method into a logger
# in verbose mode
module RailsAsyncMigrations
  module Locker
    class Overwrite
      attr_reader :instance, :method_name

      def initialize(instance, method_name)
        @instance = instance
        @method_name = method_name
      end

      def perform
        tracer.verbose("#{instance.class}\##{method_name} was called in locked state")
      end

      private

      def mode
        RailsAsyncMigrations.config.mode
      end

      def tracer
        @tracer ||= Tracer.new(mode)
      end
    end
  end
end
