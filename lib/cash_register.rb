require 'pry'
class CashRegister
    
attr_accessor :total, :discount

    def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart =[]
    @previous_total = 0
    end

    def add_item(title, price, quantity = 1)
        # @cart << price 
        # @cart.each do |price|
            @total = @total + price * quantity
            @cart << title * quantity.times 
        end
        
        def apply_discount
            if @discount > 0
                @total = @total - @total * @discount / 100
                    return "After the discount, the total comes to $#{@total}."
                else 
                    return "There is no discount to apply."
            end
        end

        def items
            @cart
        end
end