require 'thor'
require 'pathname'

bin_file = Pathname.new(__FILE__).realpath

module Bookery
  class CLI < Thor
    include Thor::Actions

    source_paths << File.expand_path(
        '../../../templates',
        Pathname.new(__FILE__).realpath
      )

    desc 'new PATH', 'creates a new book in PATH'
    def new(path, template_name = 'book')
      directory(template_name, path)
    end

  end
end
