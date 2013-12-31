module Bookery
  class Project
    attr_reader :dir, :config

    DEFAULTS = {
      book_dir: 'book',
      assets_dir: 'assets',
      config_file: 'config.yml'
    }

    def initialize(project_dir, config = {})
      @dir = project_dir
      @config = DEFAULTS.merge(config)
    end

    def book_config
      @book_config ||= Proc.new do
        conf = config[:book]
        conf[:template] = File.join(dir, conf[:template])
        conf
      end.call
    end

    def generator_config
      conf = config[:generator]
      conf[:project_dir] = dir
      conf
    end

    def books
      @books ||= load_books
    end

    def assets
      Dir.glob(File.join(dir, config[:assets_dir], '**/*')).reject do |file|
        File.directory?(file) or file =~ /\/(includes|templates)\//
      end
    end

    def publish(publishers)
      books.each do |book|
        prepare_output_dir(book)
        publishers.each { |publisher| publisher.publish(book) }
      end
    end

    private

    def prepare_output_dir(book)
      output_dir = File.join(dir, 'output', book.language)
      ::FileUtils.rm_rf(output_dir)
      ::FileUtils.mkdir_p(output_dir)

      assets.each do |asset|
        dest = File.dirname(File.join(output_dir, asset.sub("#{dir}/", '')))
        ::FileUtils.mkdir_p(dest)
        ::FileUtils.cp(asset, dest)
      end
    end

    def load_books
      path = File.join(dir, config[:book_dir])
      Dir.entries(path).sort.collect do |language|
        make_book(path, language) unless language =~ /\.\.?\z/
      end.compact
    end

    def make_book(path, language)
      Book.new(
        Factories::ChapterFactory.create_chapters(File.join(path, language)),
        Config.new(language, book_config)
      )
    end
  end
end
