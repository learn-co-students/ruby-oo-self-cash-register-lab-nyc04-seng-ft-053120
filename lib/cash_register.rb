
class CashRegister
    attr_accessor :total, :discount, :title, :price 
    def initialize(discount = 0)
        @total = 0
        @discount = discount 
        @items = []
    end
    def add_item(title, price, quantity=1)
        @price = price 
        @total += price * quantity
        @last_item = price * quantity
        quantity.times do 
        @items << title 
        end 
    end
    def apply_discount
        if @discount != 0
            @total = total - (total * @discount / 100 )
            return "After the discount, the total comes to $#{total}."
        end    
            "There is no discount to apply."
    end
    def items
        @items 
    end
    def void_last_transaction
        @total = total - @last_item
    end
end