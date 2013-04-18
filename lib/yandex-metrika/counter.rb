require 'active_support/core_ext/string/output_safety'
require 'erb'
module YandexMetrika
  class Counter
    attr_reader :local, :counter_types, :noscript, :async

    autoload :Kind, 'yandex-metrika/counter/kind'
    autoload :Renderer, 'yandex-metrika/counter/renderer'
    autoload :TemplateOptions, 'yandex-metrika/counter/template_options'

    def initialize(args = {})
      @options_types ||= []
      prepare_view_options(args)
      append_counter_types(args)
      @options_renderer = YandexMetrika::Counter::Renderer.new(@options_types)
    end

    def to_s
      template_name = @async ? "async" : "sync"
      @template ||= ::ERB.new ::File.read ::File.expand_path("../templates/#{template_name}.erb", __FILE__)
      @template.result(template_options.instance_eval { binding }).html_safe
    end
    alias_method :render, :to_s

    protected

    def template_options
      TemplateOptions.new({
        counter_name: "yaCounter#{YM.counter}",
        counter_options: @options_renderer.to_s
      })
    end

    def prepare_view_options(args)
      @local = args.delete(:local) || false
      @async = args.delete(:async) || true
      @noscript = args.delete(:noscript) || true
    end

    def append_counter_types(args = {})
      args = YM.defaults.merge(args)
      @options_types << Kind.new(:id, YM.counter)
      args.each do |k,v|
        @options_types << Kind.new(k,v)
      end
    end
  end
end
