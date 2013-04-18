module YandexMetrika
  class Counter::Renderer
    attr_reader :counter_types_collection
    DELIMITER = ', '
    def initialize(counter_types_collection)
      @counter_types_collection = counter_types_collection
    end

    def render
      @counter_types_collection.map{|ct| ct.to_s}.join(DELIMITER)
    end
  end
end
