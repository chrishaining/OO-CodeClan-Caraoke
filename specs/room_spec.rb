require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')
require_relative('../drink')
require('pry')

class RoomTest < MiniTest::Test

  def setup #ARRANGE
    @room1=Room.new("Room 1", 3, 15)
    @room2=Room.new("Room 2", 2, 20)

    @song1=Song.new("White Christmas")
    @song2=Song.new("Simply the best")
    @song3=Song.new("All you need is love")
    @song4=Song.new("The shoop shoop song")
    @song5=Song.new("Ave Maria")

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

  def test_room_has_name
    assert_equal("Room 1", @room1.room_name()) #ASSERT and ACT
  end

  #the playlist is an array that we will populate later, so it starts empty. Hence, I want to test that it is empty.
  def test_room_starts_with_empty_playlist
    assert_equal([], @room1.show_playlist()) #OR DO WE COUNT THIS?
  end

  #the playlist array now needs to get songs added to it. I could just test this works by counting, but I think we want to actually see which songs a room has. So, the function will return the contents of the array.
  def test_room_can_add_songs_to_playlist
    expected = [@song1]
    actual_result = @room1.add_song_to_playlist(@song1)
    assert_equal(expected, actual_result)
  end

  #Because .add_song_to_playlist adds the whole song (and all its attributes) to the playlist array, the result of displaying the playlist will be ugly. At this stage users only want the title (though in an extended brief they might want other attributes such as artist, song length, year records). So I want to return just the titles.
  def test_show_playlist_titles
    expected = ["White Christmas", "Ave Maria"]
    @room1.add_song_to_playlist(@song1)
    @room1.add_song_to_playlist(@song5)
    actual_result = @room1.show_playlist_titles()
    assert_equal(expected, actual_result)
  end

  #next tests are checking guests into a room. responsibility was something I debated (it could be the guest controlling this, or even an outside class (such as reception). However, based on similar systems we have worked on, I think it's simplest to make the room responsible for booking (we could assume that the room by definition has a receptionist). The simple function will just be the ability to add a guest, whilst developments might include making sure the room does not get overbooked (needs a capacity integer and an array of occupants to count), and preventing people from booking if they have no money. how would we assert the basic test? We'll need to instantiate some guests, plus we need an array of occupants - at this point, we don't care who the occupants are, so a count would be sufficient. We need to begin by testing that the room starts empty

  def test_count_occupants_room_at_start_is_empty
    assert_equal(0, @room1.count_occupants())
  end

  #Extension: What happens if there are more guests trying to be checked in than there is free space in the room? We would want a conditional to return out of the check_in function if number_of_guests > capacity (occupants.count). Although not explicitly stated, I think there is an implicit suggestion to check_in groups of guests. However, I can't think how to do this, so will leave it until after I have completed other extensions. To test it, we would have to try to put too many guests into a room. expected result could be true/false or a return statement.
  #First, I need to check that the count_occupants array works if we add people to it.
  def test_count_occupants_array
    @room2.check_in_guest(@guest2)
    @room2.check_in_guest(@guest3)
    assert_equal(2, @room2.count_occupants())
  end

  #Then I add a new part to the check_in function to return if there is not enough room. VERSION A
  # def test_guests_cannot_be_checked_in_to_full_room
  #   @room2.check_in_guest(@guest2)
  #   @room2.check_in_guest(@guest3)
  #   @room2.check_in_guest(@guest4)
  #     assert_equal("Come on now go! Walk out the door! Just turn around now, cause you're not welcome any more.", @room2.room_is_full?())
  # end

  #Extension: Karaoke venues usually have an entry fee - So the guests could have money so they can pay it. So, the customer will have a wallet (initialized, attr_READABLE, with an integer). The room class will have a fee, also an integer. If the wallet < fee, check_in cannot continue. There is no need at this point for rooms to have a till, as it isn't in the brief.
  # def test_guests_cannot_be_checked_in_if_they_cannot_afford_fee
  # assert_equal("The best things in life are free. Go and do them instead!", @room2.guest_cannot_pay_fee?(@guest1))
  # end

  # def test_room_can_check_in_guest_can_pay_fee
  # @room1.check_in_guest(@guest2)
  # assert_equal(, @room1.count_occupants())
  # end

  def test_room_can_check_in_guest__sufficient_capacity
    @room1.check_in_guest(@guest2)
    @room1.check_in_guest(@guest3)
    assert_equal(2, @room1.count_occupants())
  end

  # def test_room_can_check_in_guest__insufficient_capacity
  # @room2.check_in_guest(@guest2)
  # @room2.check_in_guest(@guest3)
  # @room2.check_in_guest(@guest4)
  # #binding.pry
  # assert_equal("Come on now go! Walk out the door! Just turn around now, cause you're not welcome any more.", @room2.check_in_guest(@guest4))
  # end

  def test_room_can_check_in_guest__insufficient_capacity
    @room2.check_in_guest(@guest3)
    @room2.check_in_guest(@guest4)
    assert_equal("Sorry. There's no room.", @room2.check_in_guest(@guest4))
  end

  def test_room_can_check_in_guest_can_pay_fee
    @room1.check_in_guest(@guest2)
    assert_equal(1, @room1.count_occupants())
  end

  def test_guests_cannot_be_checked_in_if_they_cannot_afford_fee
    assert_equal("You don't have enough money to get in.", @room2.check_in_guest(@guest1))
  end

  def test_room_can_check_out_guest
    @room1.check_in_guest(@guest2)
    @room1.check_in_guest(@guest3)
    @room1.check_out_guest(@guest4)
    assert_equal(2, @room1.count_occupants())
  end

  # def test_guests_cannot_be_checked_in_to_full_room
  #   @room2.check_in_guest(@guest1)
  #   @room2.check_in_guest(@guest2)
  #   assert_equal("Come on now go! Walk out the door! Just turn around now, cause you're not welcome any more.", @room1.check_there_is_enough_room_for_guest(@guest2))
  # end

  def test_shouts_woo_if_guest_favourite_song_is_on_playlist
    assert_equal("Wooooooooo!!!!", @room1.cheer_for_favourite_song(@guest2))
  end

  #each room will have a stock of drinks to sell to guests, drinks_stock. First, we test that the starting state for drinks_stock is 'empty'.
  def test_room_has_drink_stock__starts_empty
    assert_equal(0, @room1.show_drinks_count())
  end

  #Next we test that rooms can add drink to drinks_stock. I've done two asserts here - a count method (show_drinks_count) and one that shows the contents of the array (show_drinks)
  def test_room_can_add_drinks_to_stock
    @room1.add_drinks_to_stock(@vodka)
    @room1.add_drinks_to_stock(@vodka)
    @room1.add_drinks_to_stock(@water)
    @room1.add_drinks_to_stock(@cola)
    assert_equal(5, @room1.show_drinks_count())
  end

  def test_room_can_add_drinks_to_stock
    @room1.add_drinks_to_stock(@drink1)
    @room1.add_drinks_to_stock(@drink2)
    @room1.add_drinks_to_stock(@drink1)
    expected = [@drink1, @drink2, @drink1]
    assert_equal(expected, @room1.show_drinks())
  end

  #now we know we can add to drinks_stock, we can remove from drinks_stock and sell to guests. That entails - check that drink is in stock and return if not->check that guest can afford it and return if not->remove drink from stock->add drink to guest->add price to guest_tab. there will need to be a check on the guest tab to ensure that customer can afford to pay it.
  def test_can_remove_from_drinks_stock__drink_not_in_stock
    @room1.add_drinks_to_stock(@drink1)
    @room1.add_drinks_to_stock(@drink2)
    expected = "Sorry, we don't have that drink. Can I get you something else?"
    assert_equal(expected, @room1.tell_guest_drink_is_not_in_stock(@drink3))
  end

  #tests that the room refuses to serve a drink to a customer who cannot afford that drink. may need to change this.
  def test_guest_cannot_buy_drink_if_they_have_insufficient_funds
    @room1.add_drinks_to_stock(@drink1)
    @room1.add_drinks_to_stock(@drink2)
    guest6=Guest.new("Kaka", 1.00, "Always look on the bright side of life.")
    guest6.show_tab
    expected = "You can't afford this drink."
    assert_equal(expected, @room1.refuse_guest_drink_if_they_cannot_afford_it(guest6, @drink1))
  end

  #tests that if the room serves a drink to a guest, it removes the drink from drinks_stock
  def test_drinks_stock_decreases_if_room_serves_drink
    @room1.add_drinks_to_stock(@drink1)
    @room1.add_drinks_to_stock(@drink2)
    @room1.serve_drink_to_guest(@guest2, @drink2)
    assert_equal(1, @room1.show_drinks_count())
  end

  #tests that if the room serves a drink to a guest, the guest tab increases. Tab is for drinks.
  def test_guest_tab_increases_if_room_serves_them_drink
    @room1.add_drinks_to_stock(@drink1)
    @room1.add_drinks_to_stock(@drink2)
    @room1.serve_drink_to_guest(@guest2, @drink2)
    assert_equal(1.50, @guest2.show_tab())
  end

  #Before testing that the till increases, we should check it starts at 0
  def tests_that_till_starts_at_0
    assert_equal(0, @room1.till())
  end

  #tests that when the guest pays their tab, the room's till increases accordingly.
  def test_till_increases_when_guest_pays_tab
    @room1.add_drinks_to_stock(@drink2)
    @room1.serve_drink_to_guest(@guest2, @drink2)
    @room1.guest_pays_tab(@guest2)
    assert_equal(1.50, @room1.till())
  end

  #tests that when a guest pays their tab, their wallet decreases
  def test_guest_wallet_decreases_when_they_pay_their_tab
    @room1.add_drinks_to_stock(@drink2)
    @room1.serve_drink_to_guest(@guest2, @drink2)
    @room1.guest_pays_tab(@guest2)
    assert_equal(18.50, @guest2.wallet())
  end
  

  #DO NOT TOUCH. THIS IS THE END FOR THE TEST CLASS.
end
