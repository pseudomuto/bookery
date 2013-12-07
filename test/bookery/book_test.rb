require 'test_helper'

class BookTest < AppTest
  def setup
    super
    @book = Bookery::Book.new('en', cwd: 'sandbox')
  end

  def test_chapter_names
    expected_names = ['Introduction', 'Second Chapter']

    puts @book.chapter_names
    refute_empty @book.chapter_names

    @book.chapter_names.each do |name|
      assert_includes expected_names, name
    end
  end

  def template_name
    'sample'
  end
end
