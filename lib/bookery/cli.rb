module Bookery
  class CLI < Thor
    include Thor::Actions

    map 'v' => :version

    desc 'version', 'prints the version of bookery being used'
    def version
      puts Bookery::VERSION
    end

    desc 'new <path>', 'creates a new book at the specified path'
    method_option :template, banner: '<template>'
    def new(path)
      template = 'book'
      template = options[:template] if options[:template]
      directory(template, path)
    end
  end
end
