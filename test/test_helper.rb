require 'simplecov'
SimpleCov.start do
  add_filter "/vendor/"
end

require 'minitest/autorun'
require 'minitest/pride'
require File.expand_path('../../lib/bookery', __FILE__)

require 'stringio'

def capture(stream)
  begin
    stream = stream.to_s
    eval "$#{stream} = StringIO.new"
    yield
    result = eval("$#{stream}").string
  ensure
    eval("$#{stream} = #{stream.upcase}")
  end

  result
end

alias :silence :capture

class AppTest < MiniTest::Unit::TestCase
  def template_name
    'book'
  end

  def setup
    silence(:stdout) do
      args = ['new', destination_root, template_name]
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
