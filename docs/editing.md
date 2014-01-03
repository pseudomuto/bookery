# Editing

All book content is written in markdown. For a run down on markdown, check out Daring Fireball's [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax).

When using the default options, [Github Flavored Markdown](https://help.github.com/articles/github-flavored-markdown) is fully supported.

## Useful Information

* Markdown inside HTML blocks will not be processed
* CodeRay is used for syntax highlighting. For a list of supported languages check out the [home page].

[home page]: http://coderay.rubychan.de/

## Using Images

Images should be stored in the assets folder. You're free to choose any structure you like, but I would suggest an aptly named folder like _images_ or _img_.

When referencing an image in your markdown files, use the relative path from the project directory. For example, in _book/en/001-first-chapter.md_ you can reference _assets/images/cover.png_ like so:

<pre>
&#33;[My Image Alt Text](assets/images/cover.png)
</pre>

## For technical writers, these might be of particular interest

### Fenced Code Blocks

You can include codce samples using fenced code blocks using back ticks and optionally the language name. For example, you could include a ruby class like this:

<pre>
  &#96;&#96;&#96;ruby
  module Demo
    class Foo
      attr_reader :baz

      def initialize(baz = 'demo')
        @baz = baz
      end

      def bar(suffix)
        "#{baz}#{suffix}"
      end
    end
  end
  &#96;&#96;&#96;
</pre>

This would result in output like this:

```ruby
module Demo
  class Foo
    attr_reader :baz

    def initialize(baz = 'demo')
      @baz = baz
    end

    def bar(suffix)
      "#{baz}#{suffix}"
    end
  end
end
```

### Including Code Files

Sometimes large code blocks can make your chapter files too large and harder to manage. To help with this, you can include external code files by using the following syntax:

<pre>
  &#96;&#96;&#96;&lt;language&gt;
  includes::&lt;path_to_include_file&gt;
  &#96;&#96;&#96;
</pre>

The `path_to_include_file` above should be replaced with a path to a file relative to the _assets/includes_ directory. For example, to include _assets/includes/ruby/chapter2_fig1.rb_ you would use the following:

<pre>
  &#96;&#96;&#96;ruby
  includes::ruby/chapter2_fig1.rb
  &#96;&#96;&#96;
</pre>
