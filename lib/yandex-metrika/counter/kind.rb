module YandexMetrika
  class Counter::Kind
    attr_reader :name, :value
    def initialize(name, value)
      @name, @value = name, value
    end

    def to_s
      "#{@name}:#{@value}"
    end
  end
end
