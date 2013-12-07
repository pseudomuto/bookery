module Bookery
  class Book
    attr_reader :lang

    def initialize(lang, options = {})
      @lang = lang
      @cwd = options[:cwd] || ''
    end

    def chapter_names
      Dir.entries(book_dir).collect do |entry|
        if entry.size > 2
          entry[3, entry.size].gsub(/-/, ' ').capitalize
        else
          nil
        end
      end.compact
    end

    private

    def book_dir
      File.join(@cwd, 'book', @lang)
    end
  end
end
