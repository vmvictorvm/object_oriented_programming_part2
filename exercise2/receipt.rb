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
