require 'check_mk/agents/dummy_agent'
require 'sidekiq/api'

module CheckMK
  module Agents
    class Sidekiq < CheckMK::Agents::DummyAgent
      AGENT_NAME = 'sidekiq'

      def stats
        result = {}

        %w(processed failed enqueued workers_size).each do |stat|
          result[stat] = sidekiq_stats.send(stat.to_sym)
        end

        result['active_workers'] = sidekiq_workers.size
        result
      end

      private

      def sidekiq_workers
        @workers ||= ::Sidekiq::Workers.new
      end

      def sidekiq_stats
        @stats ||= ::Sidekiq::Stats.new
      end

    end
  end
end
