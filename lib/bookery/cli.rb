require 'thor'

module Bookery
  class CLI < Thor
    include Thor::Actions

    source_root File.dirname(File.dirname(__FILE__))

    desc 'new PATH', 'creates a new book in PATH'
    def new(path)
      directory('templates/book', path)
    end
  end
end
