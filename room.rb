class Room

  attr_reader(:room_name)

  def initialize(room_name)
    @room_name = room_name
    @playlist = []
  end

#.show_playlist method returns the array of songs for a given room. I originally put a parameter of room, but this is unnecessary as the method is always called on the instance of the room (so, we already know which room the method applies to)
  def show_playlist()
    return @playlist #note that if I change return to puts, the test fails, but if I change it to 'p' it passes.
  end

#.add_song_to_playlist adds an instance of the song class to the playlist array.
def add_song_to_playlist(song)
  @playlist << song
end

#Because .add_song_to_playlist adds the whole song (and all its attributes) to the playlist array, the result of displaying the playlist will be ugly. At this stage users only want the title (though in an extended brief they might want other attributes such as artist, song length, year records). So I want to return just the titles.
def show_playlist_titles()
  return @playlist.map { |song| song.title }
end

end
