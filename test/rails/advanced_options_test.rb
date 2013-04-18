require "test_helper"
require "yandex-metrica/rails/view_helpers"

class AdvancedOptionsTest < TestCase
  include YandexMetrica::Rails::ViewHelpers

  def setup
    YM.counter = 123
  end

  def test_should_not_render_without_counter
    YM.counter = ""
    metrica_init_script = metrica_init
    refute_match %r{w\.yaCounter}, metrica_init_script
  end

  def test_script_should_be_sync
    metrica_init_script = metrica_init(async: false)
    refute_match %r{w\.yaCounter}, metrica_init_script
  end

end
