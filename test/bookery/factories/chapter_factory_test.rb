require 'test_helper'

class ChapterFactoryTest < Minitest::Test

  def setup
    book_dir = 'test/data/project/book/en'
    @chapters = Bookery::Factories::ChapterFactory.create_chapters(book_dir)
  end

  def test_create_chapters_loads_each_chapter
    assert_equal 2, @chapters.size
  end

  def test_each_chapter_loads_chapter_files
    expected = [
      '# The Second Chapter',
      '# Another File in Chapter 2'
    ]

    expected.each do |string|
      assert_includes @chapters.last.content, string
    end
  end
end
