require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')

class GuestTest < MiniTest::Test

  def setup
    @guest1=Guest.new("Amy", 10, 0, "Rainy days and Mondays")
    @guest2=Guest.new("Mo", 20, 0, "The shoop shoop song")
    @guest3=Guest.new("Sam", 20, 0, "Girls just wanna have fun")
    @guest4=Guest.new("Jodi", 20, 0, "White Christmas")
    @guest5=Guest.new("Shaz", 20, 0, "Boom boom")
  end

  def test_guest_has_name
    assert_equal("Jodi", @guest4.name())
  end

  def test_guest_has_favourite_song
    assert_equal("Boom boom", @guest5.favourite_song())
  end

  def test_guest_tab_starts_at_0
    assert_equal(0, @guest5.show_tab())
  end

# def test_guest_tab_increases_when_they_buy_drink
#
#
# assert_equal(1.50, @guest5.show_tab())
# end
  # def test_guest_starting_location_is_nil
  #   assert_nil(@guest4.location())
  # end



end
