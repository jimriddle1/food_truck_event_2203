require './lib/item'
require './lib/food_truck'

describe Item do
    it 'exists' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(item1).to be_an_instance_of(Item)
    end

  end
