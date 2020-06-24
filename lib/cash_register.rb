class CashRegister
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
    end

    def discount
        @discount
    end

    def total
        @total
    end

    def total=(total)
        @total = total
    end

    def add_item(title, price, quantity = 1)

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

    def items
        
    end
end