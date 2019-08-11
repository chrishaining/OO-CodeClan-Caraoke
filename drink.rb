class Drink

#the drink class is simple, with only one attribute to start - price. I originally had type and price (with each instance in the spec file having the form @Drink 1(name="vodka", price=1:50)). But because each instance is not unique (so, I could have multiple copies of @Drink1 in stock) it is unnecessary to use the identifier @drink1. It's simpler to have only one attribute. OR???!!!
attr_reader(:type, :price)

def initialize(type, price)
  @type = type
  @price = price
end


#DO NOT TOUCH. THIS IS THE END FOR THE CLASS.
end
