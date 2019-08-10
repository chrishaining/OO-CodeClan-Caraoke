#This class structure assumes that guests go to the karaoke rooms alone. In reality, they might go in groups, and this is a possible extension that could be made.

class Guest

attr_reader(:name, :wallet)
#attr_accessor(:location)


  def initialize(name, wallet)
    @name = name
    @wallet = wallet
#    @location = nil
  end

#.location - this will be dependent on a function in the room class. Once the room class has assigned a guest to a room, that guest's location should update to the new room.
# def location()
#   @location == ??
# end

end
