require 'yandex-metrica/version'
require 'yandex-metrica/counter'

module YandexMetrica
  DEFAULTS = {
    webvisor: true,
    clickmap: true,
    trackLinks: true
  }

  class << self
    def counter
      @counter || nil
    end

    def counter=(counter)
      @counter = counter
    end

    def valid_counter?
      !invalid_counter?
    end

    def invalid_counter?
      counter.nil? || counter == ""
    end

    def set_counters(*counters)
      counters.each{|c| add_counter(c)}
    end

    def add_counter(counter)
      @options ||= {}
      @options[counter] = true
    end

    def options
      @options ||= DEFAULTS
    end

    def reset!
      @options = nil
    end
  end

end

YM = YandexMetrica
if defined?(Rails)
  require 'yandex-metrica/rails/railtie'
  YMR = YandexMetrica::Rails
end
