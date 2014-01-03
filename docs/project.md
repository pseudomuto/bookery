# Project Layout/Structure

Each _book_ is represented a project containing:

* assets
* one or more books (one per language)
* configuration

## Directory Structure

Using the default template will result in a project with the following directory structure:

```
[project]
  assets
    css
      [CSS files]
    includes
    templates
      template.html.erb
    style.css
  book
    en
      001-first-chapter
        01-chapter-file.md
  config.yml
  Gemfile
```

### Assets

The assets folder contains static files that are used by your book. These files can include templates, stylesheets, images, code files or anything else you like.

### Book

In the book directory, you will find a directory for each language you wish to support. By default, you will have an _en_ directory. If you wish to have another language, simply create a new folder under this directory with the abbreviated language code.

For example, to create a Spanish version of your book, create a directory called _es_.

Under each language directory, markdown files (_*.md_) contain the content of your book. For better organization (I told you this project was opinionated), each language directory is expected to follow something like this:

```
[lang]
  [chapter]
    [one or more md files]
```

During publishing, chapters (sub directories) will be combined in alphabetical order. Each of them combining their files in alphabetical order.

_I suggest following a naming convention to make this easy. I use `001-<chapter_name>` and `01-<filename>.md` for each file within a chapter._

For information on editing, check out the [editing docs](editing.md).

### Configuration

The _config.yml_ file contains configuration information for your book. A typical file might look like this:

```yaml
---
book:
  title: My Book
  authors:
    - Your Name
    - Your Co-Author's Name
  editors:
    - Your Editor's Name
    - Other Editor's Names
  template: assets/templates/template.html.erb
```

You can override values on a per language basis. You can also specify special configuration options for the publishing process.

For more details, see the [documentation for configuration](config.md).

### The Gemfile

This is a file used by ruby/bundler. For the most part you can ignore this file.
