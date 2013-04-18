module YandexMetrica::Rails
  class Railtie < ::Rails::Railtie
    initializer "yandex-metrica-rails" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
