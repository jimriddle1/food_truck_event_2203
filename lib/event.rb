class Event

  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def sorted_item_list
    unsorted = @food_trucks.map do |truck|
      truck.inventory.map do |item|
        item[0]
      end
    end.flatten.uniq
    sorted = unsorted.sort_by do |item|
      item.name
    end
    # require 'pry'; binding.pry
  end
end
