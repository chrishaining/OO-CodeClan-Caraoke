require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../room')
require_relative('../drink')

class GuestTest < MiniTest::Test

  def setup
    @room1=Room.new("Room 1", 3, 15)
    @room2=Room.new("Room 2", 2, 20)

    @guest1=Guest.new("Amy", 10, "Rainy days and Mondays")
    @guest2=Guest.new("Mo", 20, "The shoop shoop song")
    @guest3=Guest.new("Sam", 20, "Girls just wanna have fun")
    @guest4=Guest.new("Jodi", 20, "White Christmas")
    @guest5=Guest.new("Shaz", 20, "Boom boom")

    @drink1=Drink.new("Vodka", 5.00)
    @drink2=Drink.new("Water", 1.50)
    @drink3=Drink.new("Cola", 2.50)
    @drink4=Drink.new("Milk", 1.75)
    @drink5=Drink.new("Beer", 3.00)

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

  def test_guest_wallet_decreases_when_fee_is_paid
    @guest2.wallet_decreases_when_fee_is_paid(@room1)
    assert_equal(5, @guest2.wallet())
  end

  def test_wallet_decreases_when_tab_is_paid
    @room1.serve_drink_to_guest(@guest2, @drink2)
    @guest2.wallet_decreases_when_tab_is_paid()
    assert_equal(18.50, @guest2.wallet())
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
