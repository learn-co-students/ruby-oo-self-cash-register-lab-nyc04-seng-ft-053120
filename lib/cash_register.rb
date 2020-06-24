require "pry"
class CashRegister

  attr_accessor :discount, :total, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end 

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    @items << [title, price, quantity]
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else 
      @total -= @total * (@discount / 100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    end 
  end

  def items
    result = []
    @items.each do |item|
      item_quantity = item[-1]
      item_name = item[0]
      item_quantity.times { result << item_name}
    end
    result
  end

  def void_last_transaction
    last_item_name, last_item_price, last_item_quantity = @items.last
    @total -= last_item_price * last_item_quantity
    @total = 0.0 if @items.empty? 
  end
end 

