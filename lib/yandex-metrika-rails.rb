require 'yandex-metrika/version'
require 'yandex-metrika/counter'

module YandexMetrika
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

    def defaults
      @options ||= DEFAULTS
    end
  end

end

YM = YandexMetrika
if defined?(Rails)
  require 'yandex-metrika/rails/railtie'
  YMR = YandexMetrika::Rails
end
