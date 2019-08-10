require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class SongTest < MiniTest::Test

  def setup
    @song1=Song.new("White Christmas")
    @song2=Song.new("Simply the best")
    @song3=Song.new("All you need is love")
    @song4=Song.new("The shoop shoop song")
    @song5=Song.new("Ave Maria")
  end



  def test_song_has_title
    assert_equal("White Christmas", @song1.title())
  end



end
