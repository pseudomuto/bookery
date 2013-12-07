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
