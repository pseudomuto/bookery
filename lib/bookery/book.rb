module Bookery
  class Book
    attr_reader :title, :authors, :editors, :language
    attr_reader :chapters

    def initialize(chapters, config)
      @title = config[:title]
      @authors = config[:authors]
      @editors = config[:editors]
      @language = config[:language]
      @chapters = chapters
    end

    def content
      chapters.inject('') do |content, chapter|
        content << chapter.content
      end
    end
  end
end
