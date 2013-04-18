require "test_helper"

class ConfigurationBuilderTest < TestCase
  def setup
    YM.set_counters(:webvisor, :trackLinks)
    @options = {webvisor: true, trackLinks: true}
  end

  def test_should_have_specific_configuration
    assert_equal @options, YM.options
  end

  def teardown
    YM.reset!
  end
end
