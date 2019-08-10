require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')
require('pry')

class RoomTest < MiniTest::Test

def setup #ARRANGE
  @room1=Room.new("Room 1")
  @room2=Room.new("Room 2")

  @song1=Song.new("White Christmas")
  @song2=Song.new("Simply the best")
  @song3=Song.new("All you need is love")
  @song4=Song.new("The shoop shoop song")
  @song5=Song.new("Ave Maria")
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
  #binding.pry
  assert_equal(expected, actual_result)
end



end
