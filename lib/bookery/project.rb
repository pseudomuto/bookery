module Bookery
  class Project
    attr_reader :dir, :options

    DEFAULTS = {
      book_dir: 'book',
      assets_dir: 'assets',
      config_file: 'config.yml'
    }

    def initialize(project_dir, options = {})
      @dir = project_dir
      @options = DEFAULTS.merge(options)
    end

    def config
      @config ||= YAML.load_file(File.join(dir, options[:config_file]))
    end

    def books
      @books ||= load_books
    end

    def publish(publishers)
      books.each do |book|
        publishers.each { |publisher| publisher.publish(book) }
      end
    end

    private

    def load_books
      books = []
      path_prefix = File.join(dir, options[:book_dir])

      Dir.entries(path_prefix).sort.each do |path|
        next if path =~ /\.\.?\z/

        books << Book.new(
          ChapterFactory.create_chapters(File.join(path_prefix, path)),
          Config.new(path, config['book'])
        )
      end

      books
    end
  end
end
