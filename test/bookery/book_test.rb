require 'test_helper'

class BookTest < AppTest
  def setup
    super
    @book = Bookery::Book.new('en', cwd: 'sandbox')
  end

  def test_loads_chapters
    expected_names = ['Introduction', 'Second Chapter']
    actual_names = @book.chapters.map { |c| c.name }

    assert_equal expected_names, actual_names
  end

  def template_name
    'sample'
  end
end
