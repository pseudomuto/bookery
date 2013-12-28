module Bookery
  class Config
    META_METHODS = [:title, :authors, :editors]

    attr_reader :language

    def initialize(language, config)
      @language = language
      @config = symbolize_keys(config)
    end

    def [](key)
      public_send(key)
    end

    def method_missing(method, *args)
      if META_METHODS.include?(method)
        if value = lang_specific_value(method)
          value
        else
          config[method]
        end
      else
        super
      end
    end

    private

    def config
      @config
    end

    def lang_specific_value(key)
      if config[language.to_sym] and config[language.to_sym][key]
        config[language.to_sym][key]
      else
        nil
      end
    end

    # Copied from http://devblog.avdi.org/2009/07/14/recursively-symbolize-keys/
    def symbolize_keys(hash)
      hash.inject({}) do |result, (key, value)|
        new_key = case key
                  when String then key.to_sym
                  else key
                  end
        new_value = case value
                    when Hash then symbolize_keys(value)
                    else value
                    end
        result[new_key] = new_value
        result
      end
    end
  end
end
