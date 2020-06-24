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
        @cart << price 
    #    @cart.reduce(:+) 
        @cart.each do |price|
            @total += price * quantity
        end
        @previous_total = 
    end
    
end