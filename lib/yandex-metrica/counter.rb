require 'active_support/core_ext/string/output_safety'
require 'erb'
module YandexMetrica
  class Counter
    attr_reader :local, :counter_types, :noscript, :async

    autoload :Kind, 'yandex-metrica/counter/kind'
    autoload :Renderer, 'yandex-metrica/counter/renderer'
    autoload :TemplateOptions, 'yandex-metrica/counter/template_options'

    def initialize(args = {})
      @options_types ||= []
      prepare_view_options(args)
      append_counter_types(args)
      @options_renderer = YandexMetrica::Counter::Renderer.new(@options_types)
    end

    def to_s
      return if YM.invalid_counter?
      template_name = @async ? "async" : "sync"
      @template ||= ::ERB.new ::File.read ::File.expand_path("../templates/#{template_name}.erb", __FILE__)
      @template.result(template_options.instance_eval { binding }).html_safe
    end
    alias_method :render, :to_s

    protected

    def template_options
      TemplateOptions.new({
        counter_name: "yaCounter#{YM.counter}",
        counter_options: @options_renderer.to_s,
        noscript: @noscript
      })
    end

    def prepare_view_options(args)
      @local = args.delete(:local) || false
      @async = true
      @async = args.delete(:async) if args.include? :async
      @noscript = true
      @noscript = args.delete(:noscript) if args.include? :noscript
    end

    def append_counter_types(args = {})
      args = YM.options.merge(args)
      @options_types << Kind.new(:id, YM.counter)
      args.each do |k,v|
        @options_types << Kind.new(k,v)
      end
    end
  end
end
