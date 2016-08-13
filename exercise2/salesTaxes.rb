require_relative 'item'
require_relative 'receipt'


#Helper method #1:  check if the name of the product(string) contains food keywords
def isFood(nameOfProd)
  if nameOfProd =~ /chocolate/i #we can add more foods here in the future
    return true
  else
    return false
  end
end

#Helper method #2:  check if the name of the product(string) contains Medical Product keywords
def isMedicalProd(nameOfProd)
  if nameOfProd =~ /pills/i #we can add more medecine keywords here in the future
    return true
  else
    return false
  end
end

#Helper method #3:  check if the name of the product(string) contains Book keywords
def isBook(nameOfProd)
  if nameOfProd =~ /book/i #we can add more books keywords here in the future
    return true
  else
    return false
  end
end

#Helper method #4:  check if the name of the product(string) contains the word "imported"
def isImported(nameOfProd)
  if nameOfProd =~ /imported/i
    return true
  else
    return false
  end
end

#Please note that input are in this format:
# 'Quantity of the item' 'name of product'  'at' 'price'
# e.g: 1 imported bottle of perfume at 27.99
#  1 -> Quantity of the item --> lineArray[0]
#  "imported bottle of perfume" --> Name of product --> lineArray[1 to length-3]
#  27.99 --> price --> lineArray[length - 1]
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



#OLD INPUT FORMAT
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
