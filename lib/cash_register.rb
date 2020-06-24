require "pry"

class Transaction
    attr_accessor :title, :price, :quantity

    @@all = []
    @@total = 0.0

    def initialize(title, price, quantity)
        @title = title
        @price = price
        @quantity = quantity
        @@all << self
    end

    def self.all
        @@all
    end

    def self.clear
        @@all = []
        @@total = 0.0
    end

    def self.total
        @@total = @@all.inject(0.0){|sum, transaction| sum + (transaction.quantity * transaction.price) }
    end
end

class CashRegister
    attr_accessor :total, :discount
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        Transaction.clear
    end

    def add_item(title, price, quantity = 1)
        Transaction.new(title, price, quantity)
        @total = Transaction.total
    end

    def apply_discount()
        if discount == 0
            return "There is no discount to apply."
        end
        @total = total - total*(0.01*discount)
        "After the discount, the total comes to $#{@total.round}."
    end

    def items
        items_arr = []
        Transaction.all.each{ |transaction| 
            transaction.quantity.times{ items_arr << transaction.title }
        }
        items_arr
    end

    def void_last_transaction
        Transaction.all.pop
        @total = Transaction.total
    end
end
