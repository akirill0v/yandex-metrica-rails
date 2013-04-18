module YandexMetrika::Rails
  module ViewHelpers

    def metrika_init(options = {})
      YandexMetrika::Counter.new(options).to_s
    end
  end
end
