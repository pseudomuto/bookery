# Bookery

[![Build Status](https://travis-ci.org/pseudomuto/bookery.png)](https://travis-ci.org/pseudomuto/bookery)
[![Gem Version](https://badge.fury.io/rb/bookery.png)](http://badge.fury.io/rb/bookery)

My own (very opinionated) custom tool for writing books. This is very much a work in progress right now.

## TODO's for a reasonable v1

* [ ] Build PDF
* [ ] Build Mobi
* [ ] Build ePub

## Installation

    $ gem install bookery

_If you're using rbenv, run `rbenv rehash` after the installation to ensure the shim is created_

## Creating a New Book

    $ bookery new <project_dir>

This will create a new [project] in the specified directory.

## Publishing

From within the project directory:

    $ bookery publish

This will generate an HTML version of your book for each language in the [project].

## Editing

For a guideline on editing, checkout the [editing] docs.

## Contributing

Wanna contribute? Awesome! Check out the [contributing guidelines] to get started.

[project]: docs/project.md
[editing]: docs/editing.md
[contributing guidelines]: docs/contributing.md
