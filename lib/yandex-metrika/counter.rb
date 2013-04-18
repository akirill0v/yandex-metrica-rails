module YandexMetrika
  class Counter
    attr_reader :local, :counter_types

    autoload :Kind, 'yandex-metrika/counter/kind'
    autoload :Renderer, 'yandex-metrika/counter/renderer'

    def initialize(options = {})
      @local = options.delete(:local) || false
      @counter_types ||= []
      append_counter_types(options)
    end

    def to_s
      options_renderer = YandexMetrika::Counter::Renderer.new(@counter_types)
      options_renderer.render
    end

    protected

    def append_counter_types(args = {})
      args.each do |k,v|
        @counter_types << Kind.new(k,v)
      end
    end
  end
end
