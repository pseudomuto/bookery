# Project Configuration

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

You can override any of the values above for a particular language, by providing a subkey for that language. For example, if you want to change the title for the Spanish version, your file would look like this:

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

  # overrides for Spanish
  es:
    title: Mi Libro
```

If there is no value specified for the current language (when publishing) the default will be used. So in the case of the file above, the template would be the same for both _en_ and _es_ books.

## Optional Configuration

If you want more control over how kramdown handles your markdown files you can provide some additional configuration options via the `generator` key. Here's an example:

```yaml
---
book:
  ...
  ...

generator:
  input: Kramdown
  enable_coderay: false
```

For a list of available options, see [kramdown's options](http://kramdown.gettalong.org/options.html). By default the following options are supplied:

```yaml
input: 'GFM'
enable_coderay: true
coderay_css: 'class'
coderay_line_numbers: 'inline'
```
