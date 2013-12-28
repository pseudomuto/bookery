require 'test_helper'

class BookTest < Minitest::Test
  def setup
    config = Bookery::Config.new('en', {
      title: 'My Title',
      authors: ['David Muto', 'Jesus Christ'],
      editors: ['Kevin Centeno', 'Kevin Ackland'],
      language: 'en'
    })

    book_dir = 'test/data/project/book/en'
    chapters = Bookery::ChapterFactory.create_chapters(book_dir)

    @book = Bookery::Book.new(chapters, config)
  end

  def test_title_pulled_from_options
    refute_empty @book.title
  end

  def test_authors_pulled_from_options
    assert_equal 2, @book.authors.size
  end

  def test_editors_pulled_from_options
    assert_equal 2, @book.editors.size
  end

  def test_language_pulled_from_options
    refute_empty @book.language
  end

  def test_content_combines_all_chapters
    expected = [
      '# The First Chapter',
      '# The Second Chapter'
    ]

    expected.each { |heading| assert_includes @book.content, heading }
  end
end
