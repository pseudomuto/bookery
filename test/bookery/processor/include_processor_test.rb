require 'test_helper'

class IncludeProcessorTest < Minitest::Test

  def setup
    @processor = Bookery::Processors::IncludeProcessor.new('./')

    File.stubs('read').with('./js/file.js').returns('function someThing() {}')
    File.stubs('read').with('./ruby/chapter2.rb').returns('def some_method; end')
  end

  def test_replaces_includes_with_file_content
    input = <<-EOF
    ```javascript
    includes::js/file.js
    ```
    EOF

    output = @processor.process(input)
    assert_includes output, 'function someThing() {}'
  end

  def test_supports_multiple_includes
    input = <<-EOF
    ```javascript
    includes::js/file.js
    ```

    ```ruby
    includes::ruby/chapter2.rb
    ```
    EOF

    output = @processor.process(input)
    assert_includes output, 'function someThing() {}'
    assert_includes output, 'def some_method'
  end
end
