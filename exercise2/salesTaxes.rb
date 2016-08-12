class Item
  attr_accessor :name
  attr_accessor :shelfPrice
  attr_accessor :prodType
  attr_accessor :priceAfterTax
  attr_accessor :imported

  def initialize(name, shelfPrice, prodType, imported)
    @name = name
    @shelfPrice = shelfPrice
    @prodType = prodType
    @priceAfterTax = 0
    @imported = imported
  end


end




class Receipt
  attr_accessor :items #Array of Item objects

    def initialize(items)
      @items= items
      @salesTax = 0
      @total = 0
    end

    def calculateTotal
      #outputArray = []
      #Loop through the array of items and
      #calculate the total price
      @items.each do |item|
        if item.imported == true
          #puts "This is import"
          if item.prodType != "book" && item.prodType != "food" && item.prodType != "medical"
            item.priceAfterTax = item.shelfPrice * 1.15
          else
            item.priceAfterTax = item.shelfPrice * 1.05
          end
        else
          #puts "This is not import"
          if item.prodType != "book" && item.prodType != "food" && item.prodType != "medical"
            item.priceAfterTax = item.shelfPrice * 1.10
          else
            item.priceAfterTax = item.shelfPrice
          end
        end
        #outputArray << "Item #{item.name} final price is #{item.priceAfterTax.round(2)}"
        #calculatedArray << item
      end
      #outputReceipt(outputArray)
      outputReceipt
    end


    def outputReceipt
      @items.each do |item|
        if item.imported == true
          puts "1 imported #{item.name} at #{item.priceAfterTax.round(2)} "
        else
          puts "1 #{item.name} at #{item.priceAfterTax.round(2)} "
        end
        @salesTax += item.priceAfterTax.round(2) - item.shelfPrice.round(2)
        @total += item.priceAfterTax.round(2)
      end
      puts "Sales Taxes: #{@salesTax.round(2)}"
      puts "Total: #{@total.round(2)}"
    end

end

aryItems = []
item1 = Item.new("book", 12.49, "book", false)
item2 = Item.new("music CD", 14.99, "other", false)
item3 = Item.new("chocolate bar", 0.85, "food", false)

aryItems = [item1, item2, item3]
receipt1 = Receipt.new(aryItems)
receipt1.calculateTotal

item4 = Item.new("box of chocolates", 10.00, "food", true)
item5 = Item.new("bottle of perfume", 47.50, "other", true)

aryItems = [item4, item5]
receipt2 = Receipt.new(aryItems)
receipt2.calculateTotal

item6 = Item.new("bottle of perfume", 27.99, "other", true)
item7 = Item.new("bottle of perfume", 18.99, "other", false)
item8 = Item.new("packet of headache pills", 9.75, "medical", false)
item9 = Item.new("box of chocolates", 11.25, "food", true)

aryItems = [item6, item7, item8, item9]
receipt3 = Receipt.new(aryItems)
receipt3.calculateTotal
