class Event

  attr_reader :name, :food_trucks, :date

  def initialize(name)
    @name = name
    @food_trucks = []
    @date = Date.today.strftime("%d/%m/%Y")
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
  end

  def sell(item, qty)
    if total_inventory[item][:quantity] < qty
      return false
    else
      @food_trucks.each do |truck|
        if truck.inventory[item] < qty
          qty -= truck.inventory[item]
          truck.inventory[item] = 0
        else
          truck.inventory[item] -= qty
        end
      end
      return true
    end
  end


end
