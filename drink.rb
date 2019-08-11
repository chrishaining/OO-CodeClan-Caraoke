class Drink

#the drink class is simple, with only two attributes (to start with, at least). The drinks won't have responsibility for other classes.
attr_reader(:type, :price)

def initialize(type, price)
  @type = type
  @price = price
end


#DO NOT TOUCH. THIS IS THE END FOR THE CLASS.
end
