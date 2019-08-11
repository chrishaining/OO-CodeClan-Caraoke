class Room

  attr_reader(:room_name, :room_capacity, :fee)

  def initialize(room_name, room_capacity, fee)
    @room_name = room_name
    @playlist = []
    @occupants = [] #This will be useful when checking that capacity has not been exceeded. It starts uninitialized
    @room_capacity = room_capacity #requires to be initialized, as it is unlikely to change - this is because it would be based on the size of the room. It's possible someone might change it in future (e.g. because they want to get more people in a room, or to give people more space. But at the moment we could assume there would be a safety decision made. E.g. a given room can hold maximum X people.)
    @fee = fee
    @drinks_stock = []
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

  #This function checks in guests by adding them to the occupants array. Because my system only allows guests to book a room individually (rather than as groups of guests) this works. However, if we wanted to allow group booking (which would be more like the real-world situation) I would have to amend the code. Might be something like 'if group_of_guests.length + @occupants.length <= @room_capacity'. I've given a silly return if the room is full, but I could change it to 'Sorry, this room is full. Would you like to try another room?'

  #I will refactor three of the tests - room_is_full?, guest_cannot_pay_fee? and check_in_guest - so that they all go into one function, check_in_guest.
  def room_is_full?()
    return "Come on now go! Walk out the door! Just turn around now, cause you're not welcome any more." if @occupants.length >= @room_capacity
  end

  def guest_cannot_pay_fee?(guest)
    return "The best things in life are free. Go and do them instead!" if guest.wallet < @fee
  end

  def check_in_guest(guest)
    return "Come on now go! Walk out the door! Just turn around now, cause you're not welcome any more." if @occupants.length >= @room_capacity
    return "The best things in life are free. Go and do them instead!" if guest.wallet < @fee
    @occupants << guest
  end
  # def check_in_guest(guest)
  #   return if room_is_full?() || guest_cannot_pay_fee?(guest)
  #   @occupants << guest
  # end

  # def check_in_guest(guest)
  #   return if room_is_full?()
  #   return if guest_cannot_pay_fee?(guest)
  #   @occupants << guest
  # end

  #This function checks out guests by removing them from the occupants array. First step is to get it to remove them. But it might be an issue if I try to remove someone who's not in the occupants array.
  def check_out_guest(guest)
    if @occupants.include?(guest) == true
      @occupants.delete(guest)
    end
    return "Guest is not in this room"
  end

  # def check_there_is_enough_room_for_guest(guest)
  #   if @occupants.length < @room_capacity
  #     check_in_guest(guest)
  #   end
  #
  # end


def cheer_for_favourite_song(guest)
  @playlist.include?(guest.favourite_song)
  return "Wooooooooo!!!!"
end

#show_drinks allows us to see the drinks stock (which is an array)
def show_drinks()
  @drinks_stock.each { |type, price| "#{type}: #{price}"}
end

def show_drinks_count()
  return @drinks_stock.length
end

#add_drinks_to_stock populates a room's drink stock
def add_drinks_to_stock(drink)
  @drinks_stock << drink
end

#check whether a drink is in stock and return if not
def tell_guest_drink_is_not_in_stock(drink)
  return "Sorry, we don't have that drink. Can I get you something else?" if @drinks_stock.include?(drink) == false
end

def refuse_guest_drink_if_they_cannot_afford_it(guest, drink)
  return "Money. That's what I want." if drink.price > guest.wallet
end

def serve_drink_to_guest(guest, drink)
  @drinks_stock.delete(drink)
  return guest.tab += drink.price

end



  #DO NOT TOUCH THE FOLLOWING END - IT IS FOR THE WHOLE CLASS
end
