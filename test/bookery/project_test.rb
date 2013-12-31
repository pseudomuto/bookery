require 'test_helper'

class ProjectTest < Minitest::Test
  def setup
    config = YAML.load_file('test/data/project/config.yml').symbolize_keys
    @project = Bookery::Project.new('test/data/project', config)
  end

  def test_book_config
    refute_empty @project.book_config[:title]
  end

  def test_generator_config
    refute_empty @project.generator_config[:input]
    assert_equal @project.dir, @project.generator_config[:project_dir]
  end

  def test_books_returns_a_book_for_each_language
    assert_equal 2, @project.books.size
  end

  def test_publish_sends_each_book_to_each_publisher
    books = @project.books
    publishers = [mock(), mock()]
    publishers.each { |pub| pub.expects(:publish).twice }

    @project.stubs(:prepare_output_dir)
    @project.publish(publishers)
  end

  def test_assets_return_without_includes_and_templates
    assert_equal 2, @project.assets.size
    assert_equal 'test/data/project/assets/images/cover.png', @project.assets.first
    assert_equal 'test/data/project/assets/style.css', @project.assets.last
  end

end
