class Event

  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
    # @total_inventory = populate_inventory
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

  def total_inventory
    hash = Hash.new{|h,k| h[k] = {quantity: 0, food_trucks: [] }}
    sorted_item_list.each do |item|
      hash[item][:food_trucks] = food_trucks_that_sell(item)
      @food_trucks.each do |food_truck|
        hash[item][:quantity] += food_truck.inventory[item]
      end
    end
    hash
  end

  def overstocked_items
    inventory = total_inventory.select do |item, info|
      info[:quantity] > 50 && info[:food_trucks].count > 1
    end.keys
    # require 'pry'; binding.pry
  end


end
