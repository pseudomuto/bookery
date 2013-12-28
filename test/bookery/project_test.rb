require 'test_helper'

class ProjectTest < Minitest::Test
  def setup
    @project = Bookery::Project.new('test/data/project')
  end

  def test_books_returns_a_book_for_each_language
    assert_equal 2, @project.books.size
  end

  def test_publish_sends_each_book_to_each_publisher
    books = @project.books
    publishers = [mock(), mock()]
    publishers.each { |pub| pub.expects(:publish).twice }

    @project.publish(publishers)
  end

end
