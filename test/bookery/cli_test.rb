require 'test_helper'

class CLITest < Minitest::Test
  def setup
    @cli = Bookery::CLI.new
  end

  def test_version_returns_gem_version
    expected = Bookery::VERSION

    output, _ = capture_io { @cli.version }
    assert_equal expected, output.chomp
  end

  def test_new_creates_project
    @cli.stubs(:directory).with('book', 'project').once
    @cli.new('project')
  end

  def test_new_creates_project_from_template
    @cli.stubs(:directory).with('example', 'project').once
    @cli.stubs(:options).returns({ template: 'example' })
    @cli.new('project')
  end

  def test_publish_publishes_book
    FileUtils.stubs(:mkdir_p)
    FileUtils.stubs(:cp)
    File.stubs(:write)

    @cli.stubs(:options).returns({ project_dir: 'test/data/project' })
    @cli.publish
  end
end
