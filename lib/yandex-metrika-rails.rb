module YandexMetrika
  YM = YandexMetrika
  if defined?(Rails)
    require 'yandex-metrika/rails/railtie'
    YMR = YandexMetrika::Rails
  end
end
