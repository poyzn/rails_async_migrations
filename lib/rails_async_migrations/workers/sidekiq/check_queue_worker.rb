# we check the state of the queue and launch run worker if needed
module RailsAsyncMigrations
  module Workers
    module Sidekiq
      class CheckQueueWorker
        include ::Sidekiq::Worker

        sidekiq_options queue: :default

        def perform
          Migration::CheckQueue.new.perform
        end
      end
    end
  end
end
