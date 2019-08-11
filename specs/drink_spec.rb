require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class DrinkTest < Minitest::Test

def setup
  @drink1=Drink.new("Vodka", 5.00)
  @drink2=Drink.new("Water", 1.50)
  @drink3=Drink.new("Cola", 2.50)
  @drink4=Drink.new("Milk", 1.75)
  @drink5=Drink.new("Beer", 3.00)
end

#test that each drink has a type (e.g. water, vodka)
def test_drink_has_type
assert_equal("Vodka", @drink1.type)
end

#test that each drink has a price
def test_drink_has_price
  assert_equal(1.50, @drink2.price)
end

#DO NOT TOUCH. THIS IS THE END FOR THE TEST CLASS.
end
