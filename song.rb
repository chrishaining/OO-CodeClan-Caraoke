class Song

#the song class is simple - only one attribute. It won't have responsibility for functions.
attr_reader(:title)

  def initialize(title)
    @title = title
  end

end
