require "pry"
class CashRegister
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    attr_accessor :discount, :total, :items, :last_transaction

    def add_item(item, price, quantity=1)
       self.total += price * quantity
       quantity.times do
           items << item
       end
       self.last_transaction = price * quantity
    end

    def apply_discount
        if discount != 0
            @total = @total - (@discount * 0.01) * @total
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= @last_transaction
    end
end