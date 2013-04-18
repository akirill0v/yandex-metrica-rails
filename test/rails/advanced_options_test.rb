require "test_helper"
require "yandex-metrika/rails/view_helpers"

class AdvancedOptionsTest < TestCase
  include YandexMetrika::Rails::ViewHelpers

  def setup
    YM.counter = 123
  end

  def test_should_not_render_without_counter
    YM.counter = ""
    metrika_init_script = metrika_init
    refute_match %r{w\.yaCounter}, metrika_init_script
  end

  def test_script_should_be_sync
    metrika_init_script = metrika_init(async: false)
    refute_match %r{w\.yaCounter}, metrika_init_script
  end

end
