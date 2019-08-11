#I have chosen the room as the class with main responsibility. I was going to create an additional reception or karaoke bar class (that is, a central point or building in which the rooms are located). However, I chose not to add this additional class as it would add a layer of complexity and was not mentioned in the brief. For a possible future extension, it might be an idea to add this reception or karaoke bar class. However, it would mean a lot of refactoring.

class Room

  attr_reader(:room_name, :room_capacity, :fee)
  attr_accessor(:till)

  def initialize(room_name, room_capacity, fee)
    @room_name = room_name
    @playlist = []
    @occupants = []
    @room_capacity = room_capacity
    @fee = fee
    @drinks_stock = []
    @till = 0
  end

  #.show_playlist method returns the array of songs for a given room.
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

  #Functions to check in guests. This function checks in guests by adding them to the occupants array. Because my system only allows guests to book a room individually (rather than as groups of guests) this works. However, if we wanted to allow group booking (which would be more like the real-world situation) I would have to amend the code. Might be something like 'if group_of_guests.length + @occupants.length <= @room_capacity'.
  def check_in_guest(guest)
    # return room_is_full?()
    # return guest_cannot_pay_fee?(guest)
    return "Sorry. There's no room." if @occupants.length >= @room_capacity
    return "You don't have enough money to get in." if guest.wallet < @fee
    @occupants << guest
  end

  #This function checks out guests by removing them from the occupants array. First step is to get it to remove them. But it might be an issue if I try to remove someone who's not in the occupants array.
  def check_out_guest(guest)
    if @occupants.include?(guest) == true
      @occupants.delete(guest)
    end
    return "Guest is not in this room"
  end

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
    return "You can't afford this drink." if drink.price > guest.wallet
  end

  def serve_drink_to_guest(guest, drink)
    return "Sorry, we don't have that drink. Can I get you something else?" if @drinks_stock.include?(drink) == false
    return "You can't afford this drink." if drink.price > guest.wallet
    @drinks_stock.delete(drink)
    guest.tab += drink.price
  end

  def guest_pays_tab(guest)
    @till = @till += guest.tab
    guest.wallet_decreases_when_tab_is_paid()
    guest.tab_clears_when_paid()
  end

  #DO NOT TOUCH THE FOLLOWING END - IT IS FOR THE WHOLE CLASS
end
