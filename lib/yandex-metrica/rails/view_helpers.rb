module YandexMetrica::Rails
  module ViewHelpers

    def metrica_init(options = {})
      YandexMetrica::Counter.new(options).to_s
    end
  end
end
