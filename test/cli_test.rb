require 'test_helper'

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

  def test_new_creates_en_folder_in_book
    assert_dir 'book/en'
  end

  def test_new_creates_assets_folder
    assert_dir 'assets'
  end

  def test_new_creates_config_yml
    assert_file 'config.yml'
  end
end
