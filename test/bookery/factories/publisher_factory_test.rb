require 'test_helper'

class PublisherFactoryTest < Minitest::Test

  def setup
    @options = {
      enable_coderay: false,
      project_dir: './',
      template: 'test/data/project/assets/template/template.html.erb'
    }
  end

  def test_create_publishers
    refute_equal 0, Bookery::Factories::PublisherFactory.create_publishers(@options)
  end
end
