require "pry"
class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

   def initialize(discount = 0)
       @total = 0
       @discount = discount
       @items = []
   end
  
   def add_item(title, price, quantity = 1)
        quantity.times do
            @items << title
        end
        # binding.pry
        self.total = @total += price * quantity    
        self.last_transaction = price * quantity
        
   end

   def apply_discount
    # find out the discount/100 .to_i
    # total times this discount  
    # return result
    if @discount > 0 
        take_off = self.total * @discount/100
        @total = self.total - take_off
        # binding.pry
        p "After the discount, the total comes to $#{self.total}."
    else 
        p "There is no discount to apply."
    end
   end

   def void_last_transaction
        @total = self.total - self.last_transaction
   end


end
