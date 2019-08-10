class Room

  attr_reader(:room_name)

  def initialize(room_name)
    @room_name = room_name
    @playlist = []
    @occupants = [] #This will be useful when checking that capacity has not been exceeded. It starts uninitialized
    #@room_capacity = room_capacity #requires to be initialized, as it is unlikely to change - this is because it would be based on the size of the room. It's possible someone might change it in future (e.g. because they want to get more people in a room, or to give people more space. But at the moment we could assume there would be a safety decision made. E.g. a given room can hold maximum X people.)
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

  #this function counts how many occupants are in a room.
  def count_occupants()
    return @occupants.length
  end

  #This function checks in guests by adding them to the occupants array. I might add conditions to it (such as only adding if there is capacity)
  def check_in_guest(guest)
    @occupants << guest
  end

  #This function checks out guests by removing them from the occupants array. First step is to get it to remove them. But it might be an issue if I try to remove someone who's not in the occupants array.
  def check_out_guest(guest)
    if @occupants.include?(guest) == true
      @occupants.delete(guest)
    end
    return "Guest is not in this room"
  end


  #DO NOT TOUCH THE FOLLOWING END - IT IS FOR THE WHOLE CLASS
end
