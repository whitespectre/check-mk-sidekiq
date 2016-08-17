module CheckMK
  module Agents
    class DummyAgent

      # Agent name -- appears in CheckMK output
      AGENT_NAME = 'dummy_agent'

      attr_reader :name

      #
      # Redefine this method in your subclass to return stats
      #
      def stats
        {}
      end

      def initialize(opts = {})
        @name = opts[:name] || self.class::AGENT_NAME
      end

      def lines
        result = []
        result << formatted_header
        stats.each do |stat, _|
          result << formatted_stat(stat)
        end
        result
      end

      def output
        lines.join("\n")
      end

      private

      def formatted_header
        "<<<#{@name}>>>"
      end

      def formatted_stat(stat)
        "#{stat} #{stats[stat]}"
      end
    end
  end
end
