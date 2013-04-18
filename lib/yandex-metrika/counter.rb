module YandexMetrika
  class Counter
    autoload :Kind, 'yandex-metrika/counter/kind'
    attr_reader :local, :counter_types
    def initialize(options = {})
      @local = options.delete(:local) || false
      @counter_types ||= []
      append_counter_types(options)
    end

    def to_s
      @counter_types.map{|i| i.to_s}.join
    end

    protected

    def append_counter_types(args = {})
      args.each do |k,v|
        @counter_types << Kind.new(k,v)
      end
    end
  end
end
