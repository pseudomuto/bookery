require 'thor'
require 'yaml'
require 'kramdown'
require 'erb'

require 'bookery/version'
require 'bookery/config'
require 'bookery/factories/chapter_factory'
require 'bookery/book'
require 'bookery/factories/publisher_factory'
require 'bookery/project'
require 'bookery/cli'

require 'bookery/processors/include_processor'

class Hash
  # Adapted from http://devblog.avdi.org/2009/07/14/recursively-symbolize-keys/
  def symbolize_keys
    self.inject({}) do |result, (key, value)|
      new_key = case key
                when String then key.to_sym
                else key
                end
      new_value = case value
                  when Hash then value.symbolize_keys
                  else value
                  end
      result[new_key] = new_value
      result
    end
  end
end
