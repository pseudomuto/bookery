require 'test_helper'

class HTMLPublisherTest < Minitest::Test
  def setup
    @publisher = Bookery::Publishers::HTMLPublisher.new({
      project_dir: 'test/data/project'
    })

    FileUtils.stubs(:mkdir_p)
    File.stubs(:write)
  end

  def with_stubbed_book(content)
    book = OpenStruct.new({
      content: content,
      title: 'Some Title',
      authors: [],
      editors: [],
      language: 'en',
      template: 'test/data/project/assets/templates/template.html.erb'
    })

    yield(book)
  end

  def test_publish_renders_html_from_markdown
    with_stubbed_book('# Introduction') do |book|
      expected = '<h1 id="introduction">Introduction</h1>'
      assert_includes @publisher.publish(book), expected
    end
  end

  def test_publish_ignores_intra_emphasis
    with_stubbed_book('_some_method_def_') do |book|
      expected = '<p><em>some_method_def</em></p>'
      assert_includes @publisher.publish(book), expected
    end
  end

  def test_publish_uses_pre_tags_for_standard_code_blocks
    content = <<-EOF
    def some_method(with, *params)
      # Do Something
    end
    EOF

    with_stubbed_book(content) do |book|
      assert_includes @publisher.publish(book), '<pre><code>'
    end
  end

  def test_publish_uses_coderay_for_fenced_code_blocks
    content = <<-EOF
```ruby
def some_method(with, *params)
  # Do Something
end
```
    EOF

    with_stubbed_book(content) do |book|
      assert_includes @publisher.publish(book), '<div class="CodeRay">'
    end
  end

  def test_publish_supports_includes
    content = <<-EOF
```ruby
includes::ruby/chapter2.rb
```
    EOF

    with_stubbed_book(content) do |book|
      assert_includes @publisher.publish(book), 'some_included_method'
    end
  end

end
