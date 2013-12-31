module Bookery
  class Config
    META_METHODS = [:title, :authors, :editors, :template]

    attr_reader :language

    def initialize(language, config)
      @language = language
      @config = config.symbolize_keys
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
  end
end
