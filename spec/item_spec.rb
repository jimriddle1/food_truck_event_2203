require './lib/item'
require './lib/food_truck'

describe Item do

    it 'exists' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      expect(item1).to be_an_instance_of(Item)
    end

    it 'has readable attrs' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      expect(item2.name).to eq("Apple Pie (Slice)")
      expect(item2.price).to eq(2.50)

    end
    
end
