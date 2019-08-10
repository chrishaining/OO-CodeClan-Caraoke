require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')
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

  @guest1=Guest.new("Amy", 10)
  @guest2=Guest.new("Mo", 20)
  @guest3=Guest.new("Sam", 20)
  @guest4=Guest.new("Jodi", 20)
  @guest5=Guest.new("Shaz", 20)
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
#binding.pry
assert_equal("Come on now go! Walk out the door! Just turn around now, cause you're not welcome any more.", @room2.check_in_guest(@guest4))
end

def test_room_can_check_in_guest_can_pay_fee
  @room1.check_in_guest(@guest2)
  assert_equal(1, @room1.count_occupants())
end

def test_guests_cannot_be_checked_in_if_they_cannot_afford_fee
assert_equal("The best things in life are free. Go and do them instead!", @room2.guest_cannot_pay_fee?(@guest1))
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





#DO NOT TOUCH. THIS IS THE END FOR THE TEST CLASS.
end
