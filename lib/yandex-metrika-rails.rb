require 'yandex-metrika/version'
require 'yandex-metrika/counter'

module YandexMetrika

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
  end

end

YM = YandexMetrika
if defined?(Rails)
  require 'yandex-metrika/rails/railtie'
  YMR = YandexMetrika::Rails
end
