class CashRegister
  attr_accessor :discount, :total, :items, :last_transaction
  
  def initialize(employee_discount=0)
    @total = 0 
    @discount = employee_discount
    @items = []
    @last_transaction = []
  end
  
  def add_item(title, price, quantity=1)
    @total += price * quantity
    quantity.times { self.items << title  }
    @last_transaction = price * quantity
  end

  def apply_discount
    if discount == 0 
      return "There is no discount to apply."
    end
    @total = (total * (1 - discount / 100.0)).to_i
    "After the discount, the total comes to $#{total}."
  end
  
  def void_last_transaction
    @total -= last_transaction
  end
end 

cash = CashRegister.new(20)
p cash.total
cash.add_item("macbook air", 1000)
p cash.total
cash.apply_discount
p cash.total