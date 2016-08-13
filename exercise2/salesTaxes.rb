class Item
  attr_accessor :name
  attr_accessor :shelfPrice
  attr_accessor :prodType
  attr_accessor :priceAfterTax
  attr_accessor :imported
  attr_accessor :quantity

  def initialize(name, shelfPrice, prodType, imported, quantity)
    @name = name
    @shelfPrice = shelfPrice
    @prodType = prodType
    @priceAfterTax = 0
    @imported = imported
    @quantity = quantity
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
            item.priceAfterTax = item.shelfPrice.round(2) * 1.15
          else
            item.priceAfterTax = item.shelfPrice.round(2) * 1.05
          end
        else
          #puts "This is not import"
          if item.prodType != "book" && item.prodType != "food" && item.prodType != "medical"
            item.priceAfterTax = item.shelfPrice.round(2) * 1.10
          else
            item.priceAfterTax = item.shelfPrice.round(2)
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
          puts "#{item.quantity} #{item.name} : #{item.priceAfterTax.round(2) * item.quantity}"
        @salesTax += (item.priceAfterTax.round(2) - item.shelfPrice.round(2)) * item.quantity
        @total += item.priceAfterTax.round(2) * item.quantity
      end
      puts "Sales Taxes: #{@salesTax.round(2)}"
      puts "Total: #{@total.round(2)}"
      puts "\n"
    end

end




#Helper method #1:  check if the name of the product(string) is a food
def isFood(nameOfProd)
  if nameOfProd =~ /chocolate/i #we can add more foods here in the future
    return true
  else
    return false
  end
end

def isMedicalProd(nameOfProd)
  if nameOfProd =~ /pills/i #we can add more medecine keywords here in the future
    return true
  else
    return false
  end
end

def isBook(nameOfProd)
  if nameOfProd =~ /book/i #we can add more books keywords here in the future
    return true
  else
    return false
  end
end

def isImported(nameOfProd)
  if nameOfProd =~ /imported/i
    return true
  else
    return false
  end
end


aryItems = []
puts "Please provide user input.  Type 'END' to ended your input"
$/ = "END"
user_input = STDIN.gets

user_input.split("\n").each do |line|
  next if line == "END"
  lineArray = line.split(" ")
  #index 0 is quantity
  quantity = lineArray[0].to_i
  #puts quantity

  #index 1 to length of the array - 3 is the name of the product
  nameOfProd = lineArray.slice(1, lineArray.length-3)
  nameOfProd= nameOfProd.join(" ")
  #puts nameOfProd

  #Last index = shelfPrice
  shelfPrice = lineArray[lineArray.length - 1].to_f
  #puts shelfPrice

  #To find product type
  if isFood(nameOfProd)
    prodType = "food"
  elsif isMedicalProd(nameOfProd)
    prodType = "medical"
  elsif isBook(nameOfProd)
    prodType = "book"
  else
    prodType = "other"
  end

  #To findout whether the product is imported or not by searching for the "imported" keyword
  if isImported(nameOfProd)
    prodImported = true
  else
    prodImported = false
  end

  item = Item.new(nameOfProd, shelfPrice, prodType, prodImported, quantity)
  aryItems << item

end
receipt = Receipt.new(aryItems)
receipt.calculateTotal




# aryItems = []
# item1 = Item.new("book", 12.49, "book", false)
# item2 = Item.new("music CD", 14.99, "other", false)
# item3 = Item.new("chocolate bar", 0.85, "food", false)
#
# aryItems = [item1, item2, item3]
# receipt1 = Receipt.new(aryItems)
# receipt1.calculateTotal
#
# item4 = Item.new("box of chocolates", 10.00, "food", true)
# item5 = Item.new("bottle of perfume", 47.50, "other", true)
#
# aryItems = [item4, item5]
# receipt2 = Receipt.new(aryItems)
# receipt2.calculateTotal
#
# item6 = Item.new("bottle of perfume", 27.99, "other", true)
# item7 = Item.new("bottle of perfume", 18.99, "other", false)
# item8 = Item.new("packet of headache pills", 9.75, "medical", false)
# item9 = Item.new("box of chocolates", 11.25, "food", true)
#
# aryItems = [item6, item7, item8, item9]
# receipt3 = Receipt.new(aryItems)
# receipt3.calculateTotal
