class CashRegister
    attr_accessor :total, :discount, :items, :last_amount, :void_last_transaction
    def initialize(discount=0)
        self.total=0
        self.discount=discount
        self.items=[]
        self.last_amount=0
    end
    def add_item(title,price,quantity=1)
        self.total+=price*quantity
        quantity.times do
            self.items<<title
        end
        self.last_amount=price*quantity
    end
    def apply_discount
        if self.discount!=0
            self.total-=(self.total*(self.discount.to_f)/100).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end
    def void_last_transaction
        self.total-=self.last_amount
    end
end
