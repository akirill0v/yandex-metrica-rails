require "test_helper"
require "yandex-metrika/rails/view_helpers"

class ViewHelpersTest < TestCase
  include YandexMetrika::Rails::ViewHelpers

  def setup
    YM.counter = 123
    YM.reset!
  end

  def test_showl_have_default_options
    metrika_init_script = metrika_init
    assert_match %r{w\.yaCounter}, metrika_init_script
    assert_match %r{id:#{YM.counter}}, metrika_init_script
    assert_match %r{webvisor:true}, metrika_init_script
    assert_match %r{trackLinks:true}, metrika_init_script
    assert_match %r{clickmap:true}, metrika_init_script
    assert_match %r{\<\/noscript\>}, metrika_init_script
  end

  def test_metrica_should_have_webvisor
    metrika_init_script = metrika_init(webvisor: true)
    assert_match %r{webvisor:true}, metrika_init_script
  end

  def test_metrica_should_have_track_links
    metrika_init_script = metrika_init(trackLinks: true)
    assert_match %r{trackLinks:true}, metrika_init_script
  end

  def test_metrica_should_have_track_hash
    metrika_init_script = metrika_init(trackHash: true)
    assert_match %r{trackHash:true}, metrika_init_script
  end

  def test_metrica_should_have_clickmap
    metrika_init_script = metrika_init(clickmap: true)
    assert_match %r{clickmap:true}, metrika_init_script
  end

  def test_metrica_should_have_accurate_track_bounce
    metrika_init_script = metrika_init(accurateTrackBounce: true)
    assert_match %r{accurateTrackBounce:true}, metrika_init_script
  end
end
