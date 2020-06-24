class CashRegister

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
    end
    #getter
    def discount
        @discount
    end
    #getter
    def total
        @total
    end
    #setter
    def total=(total)
        @total = total
    end

    #setter
    def add_item(title, price, quantity = 1)
        quantity.times do
            @cart << title
        end
        @last_price = (price * quantity)
        @total += (price * quantity)
    end

    def apply_discount
        if @discount != 0
            @total = @total - @total * @discount / 100
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end
    #getter
    def items
        @cart
    end
    
    def void_last_transaction
        @cart.delete(-1)
        @total = @total - @last_price
    end
    #getter
    def last_price
        @last_price
    end
end