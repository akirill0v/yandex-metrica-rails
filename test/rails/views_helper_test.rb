require "test_helper"
require "yandex-metrica/rails/view_helpers"

class ViewHelpersTest < TestCase
  include YandexMetrica::Rails::ViewHelpers

  def setup
    YM.counter = 123
    YM.reset!
  end

  def test_showl_have_default_options
    metrica_init_script = metrica_init
    assert_match %r{w\.yaCounter}, metrica_init_script
    assert_match %r{id:#{YM.counter}}, metrica_init_script
    assert_match %r{webvisor:true}, metrica_init_script
    assert_match %r{trackLinks:true}, metrica_init_script
    assert_match %r{clickmap:true}, metrica_init_script
    assert_match %r{\<\/noscript\>}, metrica_init_script
  end

  def test_metrica_should_not_have_noscript_tag
    metrica_init_script = metrica_init(noscript: false)
    refute_match %r{\<\/noscript\>}, metrica_init_script
  end

  def test_metrica_should_have_webvisor
    metrica_init_script = metrica_init(webvisor: true)
    assert_match %r{webvisor:true}, metrica_init_script
  end

  def test_metrica_should_have_track_links
    metrica_init_script = metrica_init(trackLinks: true)
    assert_match %r{trackLinks:true}, metrica_init_script
  end

  def test_metrica_should_have_track_hash
    metrica_init_script = metrica_init(trackHash: true)
    assert_match %r{trackHash:true}, metrica_init_script
  end

  def test_metrica_should_have_clickmap
    metrica_init_script = metrica_init(clickmap: true)
    assert_match %r{clickmap:true}, metrica_init_script
  end

  def test_metrica_should_have_accurate_track_bounce
    metrica_init_script = metrica_init(accurateTrackBounce: true)
    assert_match %r{accurateTrackBounce:true}, metrica_init_script
  end
end
