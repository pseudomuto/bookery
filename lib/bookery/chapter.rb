module Bookery
  class Chapter
    attr_reader :name

    def initialize(chapter_dir)
      @name = sanitize_name(chapter_dir)
      @dir = chapter_dir
    end

    def markup
      @markup ||= concatenate_files
    end

    private

    def sanitize_name(path)
      File.basename(path).sub(/\A\d+\s?-\s?/, '').titleize
    end

    def concatenate_files
      contents = ''

      Dir.glob(File.join(@dir, '**/*.md')) do |file|
        contents << File.read(file)
      end

      contents
    end
  end
end
