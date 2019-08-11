#This class structure assumes that guests go to the karaoke rooms alone. In reality, they might go in groups, and this is a possible extension that could be made.

class Guest

  attr_reader(:name, :wallet, :favourite_song)
  attr_accessor(:tab, :wallet)
  #attr_accessor(:location)

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @tab = 0
    @favourite_song = favourite_song
    #    @location = nil
  end


  def show_tab()
    return @tab
  end

  #.location - this will be dependent on a function in the room class. Once the room class has assigned a guest to a room, that guest's location should update to the new room.
  # def location()
  #   @location == ??
  # end

  #functions for guest wallet. these should go in guest wallet, as it is not the room's job to control the wallet. it could affect the adaptability if the room controls the wallet (e.g. if a change is made to the guest, then the room class might break.)
  def wallet_decreases_when_fee_is_paid(room)
    @wallet = @wallet - room.fee
    return @wallet
  end

  def wallet_decreases_when_tab_is_paid()
    @wallet = @wallet -= @tab
    return @wallet
  end

  def tab_clears_when_paid()
    @tab = 0
  end
  #DO NOT TOUCH THE FOLLOWING END - IT IS FOR THE WHOLE CLASS
end
