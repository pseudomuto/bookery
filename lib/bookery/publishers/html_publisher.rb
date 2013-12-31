module Bookery
  module Publishers
    class HTMLPublisher
      DEFAULTS = {
        input: 'GFM',
        enable_coderay: true,
        coderay_css: 'class',
        coderay_line_numbers: 'inline'
      }

      attr_reader :options, :processors

      def initialize(options = {})
        @options = DEFAULTS.merge(options)

        includes_path = File.join(options[:project_dir], 'assets', 'includes')
        @processors = [
          Processors::IncludeProcessor.new(includes_path)
        ]
      end

      def publish(book)
        markdown = process_content(book.content)

        pre_publish(book)
        output = Kramdown::Document.new(markdown, options).to_html

        output_dir = File.join(options[:project_dir], 'output', book.language)
        ::FileUtils.mkdir_p(output_dir)
        File.write(File.join(output_dir, 'index.html'), output)

        output
      end

      def pre_publish(book)
        erb = ERB.new(File.read(book.template))
        bound_object = TemplateObject.new(book)
        options[:template] = "string://#{erb.result(bound_object.get_binding)}"
      end

      private

      def process_content(content)
        result = content.dup
        processors.each do |processor|
          result = processor.process(result)
        end

        result
      end

      class TemplateObject
        attr_reader :title, :authors, :editors, :language, :body
        def initialize(book)
          @title = book.title
          @authors = book.authors.join(', ')
          @editors = book.editors.join(', ')
          @language = book.language
          @body = '<%= @body %>'
        end

        def get_binding
          binding
        end
      end
    end
  end
end
