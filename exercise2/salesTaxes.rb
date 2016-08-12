class Item
  attr_accessor :name
  attr_accessor :shelfPrice

  def initialize(name, shelfPrice)
    @name = name
    @shelfPrice = shelfPrice
  end


end




class Receipt
  attr_accessor :items #Array of Item objects

    def initialize(items)
      @items= items
    end

    def calculateTotal
      #Loop through the array of items and
      #claculate the total price
    end

end

aryItems = []
item1 = Item.new("book", 12.49)
item2 = Item.new("music CD", 14.99)
item3 = Item.new("chocolate bar", 0.85)
aryItems = [item1, item2, item3]
