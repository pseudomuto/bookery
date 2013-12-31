module Bookery
  module Factories
    module PublisherFactory
      extend self

      def create_publishers(config)
        [ Publishers::HTMLPublisher.new(config) ]
      end
    end
  end
end

require_relative '../publishers/html_publisher'
