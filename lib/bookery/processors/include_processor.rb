module Bookery
  module Processors
    class IncludeProcessor
      attr_reader :current_dir

      def initialize(cwd)
        @current_dir = cwd
      end

      def process(markdown)
        markdown.gsub(/\b*includes::(.*)\b*/) do |match|
          File.read(File.join(current_dir, $1))
        end
      end
    end
  end
end
