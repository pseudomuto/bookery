module Bookery
  class Project
    attr_reader :dir, :options

    DEFAULTS = {
      book_dir: 'book',
      assets_dir: 'assets'
    }

    def initialize(project_dir, options = {})
      @dir = project_dir
      @options = DEFAULTS.merge(options)
    end

    def books
      @books ||= Dir.entries(File.join(dir, options[:book_dir])).reject do |path|
        path =~ /\.\.?\z/
      end
    end

    def publish(publishers)
      books.each do |book|
        publishers.each { |publisher| publisher.publish(book) }
      end
    end
  end
end
