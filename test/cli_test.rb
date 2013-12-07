require 'test_helper'

class AppTest < MiniTest::Unit::TestCase
  def setup
    silence(:stdout) do
      args = ['new', destination_root]
      Bookery::CLI.start(args)
    end
  end

  def teardown
    ::FileUtils.rm_rf(destination_root)
  end

  def destination_root
    'sandbox'
  end

  def assert_file(relative_path)
    assert File.exist?(File.join(destination_root, relative_path))
  end

  def assert_dir(relative_path)
    assert File.directory?(File.join(destination_root, relative_path))
  end
end

class CLITest < AppTest

  def test_new_creates_readme_file
    assert_file 'README.md'
  end

  def test_new_creates_gemfile
    assert_file 'Gemfile'
  end

  def test_new_creates_book_folder
    assert_dir 'book'
  end
end
