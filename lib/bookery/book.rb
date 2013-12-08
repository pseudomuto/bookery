module Bookery
  class Book
    attr_reader :lang

    def initialize(lang, options = {})
      @lang = lang
      @cwd = options[:cwd] || ''
    end

    def chapters
      @chapters ||= Dir.entries(book_dir).collect do |entry|
        Chapter.new(entry) if entry.size > 2
      end.compact
    end

    private

    def book_dir
      File.join(@cwd, 'book', @lang)
    end

  end
end
