class Guest

attr_reader(:name)
#attr_accessor(:location)


  def initialize(name)
    @name = name
#    @location = nil
  end

#.location - this will be dependent on a function in the room class. Once the room class has assigned a guest to a room, that guest's location should update to the new room.
# def location()
#   @location == ??
# end

end
