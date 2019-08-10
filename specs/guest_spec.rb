require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')

class GuestTest < MiniTest::Test

  def setup
    @guest1=Guest.new("Amy")
    @guest2=Guest.new("Mo")
    @guest3=Guest.new("Sam")
    @guest4=Guest.new("Jodi")
    @guest5=Guest.new("Shaz")
  end

  def test_guest_has_name
    assert_equal("Jodi", @guest4.name())
  end




# def test_guest_starting_location_is_nil
#   assert_nil(@guest4.location())
# end



end
