module Bookery
  class CLI < Thor
    include Thor::Actions

    source_root(File.expand_path(
      '../../../templates',
      Pathname.new(__FILE__).realpath
    ))

    map 'v' => :version
    map 'p' => :publish

    desc 'version', 'prints the version of bookery being used'
    def version
      puts Bookery::VERSION
    end

    desc 'new <path>', 'creates a new book at the specified path'
    method_option :template, banner: '<template>'
    def new(path)
      template = 'basic'
      template = options[:template] if options[:template]
      directory(template, path)
    end

    desc 'publish', 'publishes your book'
    method_option :project_dir, banner: '<project_dir>'
    def publish
      project_dir = Dir.pwd
      project_dir = options[:project_dir] if options[:project_dir]
      config = YAML.load_file(File.join(project_dir, 'config.yml'))

      project = Project.new(project_dir, config.symbolize_keys)
      publishers = Factories::PublisherFactory.create_publishers(project.generator_config)
      project.publish(publishers)
    end
  end
end
