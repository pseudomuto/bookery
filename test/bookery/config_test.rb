require 'test_helper'

class ConfigTest < Minitest::Test
  def setup
    options = YAML.load_file('test/data/project/config.yml')
    @config = Bookery::Config.new('es', options['book'])
  end

  def test_language_specific_keys_override_globals
    assert_equal 'El libro Testing', @config.title
  end

  def test_global_values_returns_when_languages_specifics_not_found
    assert_equal 2, @config.authors.size
  end

  def test_can_retrieve_values_like_hashes
    assert_equal @config.title, @config[:title]
  end

  def test_method_missing_bubbles_to_super
    assert_raises(NoMethodError) do
      @config.invalid_meta_method
    end
  end
end
