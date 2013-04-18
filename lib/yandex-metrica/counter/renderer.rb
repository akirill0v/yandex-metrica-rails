module YandexMetrica
  class Counter::Renderer
    attr_reader :counter_types_collection
    DELIMITER = ', '
    def initialize(counter_types_collection)
      @counter_types_collection = counter_types_collection
    end

    def to_s
      @counter_types_collection.map{|ct| ct.to_s}.join(DELIMITER)
    end
    alias_method :render, :to_s

  end
end
