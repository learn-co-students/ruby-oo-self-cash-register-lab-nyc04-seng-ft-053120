require 'pry'
class CashRegister
    
attr_accessor :total, :discount, :last_item

    def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart =[]
    @previous_total = 0
    end

    def add_item(title, price, quantity = 1)
        quantity.times do 
        # @cart << price 
        # @cart.each do |price|
        @cart << title 
        end
        @last_item = price * quantity
        @total = @total + price * quantity
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

        def void_last_transaction
            @total = @total - @last_item
        end
end