# frozen_string_literal: true

class Pizza
  def pizza_description
    raise NotImplementedError, "Implement the method"
  end
end

class ConcretePizza < Pizza
  def pizza_description
    "I'm a pizza, my components: "
  end
end

class PizzaDecorator < Pizza
  def initialize(pizza)
    @pizza = pizza
  end

  def pizza_description
    @pizza.pizza_description
  end
end

class CheeseTopping < PizzaDecorator
  def pizza_description
    super + "\ncheese"
  end
end

class BeefTopping < PizzaDecorator
  def pizza_description
    super + "\nbeef"
  end
end

array = [1, 2, 3].each do |x|
  x + 1
end

puts array

pizza = ConcretePizza.new
pizza_with_cheese = CheeseTopping.new(pizza)
pizza_with_cheese_beef = BeefTopping.new(pizza_with_cheese)
pizza_with_double_cheese_beef = CheeseTopping.new(pizza_with_cheese_beef)

puts pizza_with_cheese_beef.pizza_description
puts pizza_with_double_cheese_beef.pizza_description