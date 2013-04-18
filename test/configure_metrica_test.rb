require "test_helper"

class ConfigurationBuilderTest < TestCase
  def setup
    YM.reset!
  end

  def test_should_have_specific_configuration
    YM.set_counters :webvisor, :trackLinks
    @options = {webvisor: true, trackLinks: true}
    assert_equal @options, YM.options
  end

end
