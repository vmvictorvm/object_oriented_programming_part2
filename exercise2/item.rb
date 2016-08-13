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
