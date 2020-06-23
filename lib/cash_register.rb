require 'pry'

class CashRegister
    
    attr_accessor :total, :discount, :cart, :lastTransaction
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
        @lastPrice = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price*quantity
        quantity.times do
            self.lastTransaction = {
                title: title,
                price: price,
                quantity: quantity
            }
            self.cart << title
        end
    end

    def apply_discount
        case @discount
        when 0
            "There is no discount to apply."            
        else
            self.total -= (@total* @discount/100)
            "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @cart
    end
    
    def void_last_transaction
            self.total -= self.lastTransaction[:price]*self.lastTransaction[:quantity]
    end
end