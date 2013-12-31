module Bookery
  class Book
    attr_reader :title, :authors, :editors, :language, :template
    attr_reader :chapters

    def initialize(chapters, config)
      @title = config[:title]
      @authors = config[:authors]
      @editors = config[:editors]
      @language = config[:language]
      @template = config[:template]
      @chapters = chapters
    end

    def content
      chapters.inject('') do |content, chapter|
        content << chapter.content
      end
    end
  end
end
