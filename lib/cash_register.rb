class CashRegister
    attr_accessor :total, :discount, :title, :items
    def initialize(discount = 0)
        @total = 0
        @discount = discount 
        @items = []
    end
    def add_item(title, price, quantity=1)
        self.total += price * quantity
        @last_item = price * quantity
        quantity.times do 
        @items << title 
        end 
    end
    def apply_discount
        if @discount != 0
            self.total = total - (total * @discount / 100 )
            return "After the discount, the total comes to $#{total}."
        end    
            "There is no discount to apply."
    end
    def void_last_transaction
        self.total = total - @last_item
    end
end
