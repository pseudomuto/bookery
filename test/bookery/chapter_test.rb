require 'test_helper'

class ChapterTest < AppTest
  def setup
    super
    @chapter = Bookery::Chapter.new('sandbox/book/en/02-second-chapter')
  end

  def test_name_is_sanitized
    assert_equal 'Second Chapter', @chapter.name
  end

  def test_markup_contains_all_files
    assert_match /# The first file in chapter 2/, @chapter.markup
    assert_match /# The second file in chapter 2/, @chapter.markup
  end

  def template_name
    'sample'
  end
end
