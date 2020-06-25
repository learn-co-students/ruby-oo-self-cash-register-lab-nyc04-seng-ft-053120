class CashRegister
    attr_accessor :total, :item, :amount, :quantity, :discount, :last_amount

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_amount = []
    end

    # def discount
    #     self.total
    # end

    def add_item(item, amount, quantity = 1)

        if quantity > 1
            self.total += (amount * quantity)
            quantity.times do 
                @items << item
            end
        else
            self.total += amount
            @items << item
        end
        @last_amount = amount * quantity
    end

    def apply_discount
        if discount >0
            self.total -= (self.total * (discount/100.0)).to_i
            return "After the discount, the total comes to $#{self.total}."
        else 
            return "There is no discount to apply."
         end
    end

    def items
        @items 
    end

    def void_last_transaction()
        @total -= @last_amount
    end
end
