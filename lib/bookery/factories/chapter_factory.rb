module Bookery
  module Factories
    module ChapterFactory
      extend self

      def create_chapters(book_dir)
        chapters = []

        Dir.entries(book_dir).sort.each do |path|
          next if path =~ /\.\.?\z/
          chapters << Chapter.new(File.join(book_dir, path))
        end

        chapters
      end

      private

      class Chapter
        attr_reader :name, :content

        def initialize(chapter_dir)
          @name = File.basename(chapter_dir)
          @content = combine_chapter_files(chapter_dir)
        end

        def combine_chapter_files(dir)
          Dir.glob(File.join(dir, '*.md')).sort.inject('') do |content, file|
            content << File.read(file) << "\n"
          end
        end
      end
    end
  end
end
