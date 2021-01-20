require 'pry'

class CashRegister
    attr_accessor :total, :discount; :items; :previous_item_total   

    def initialize(discount=0)
        @total = 0
        @discount = discount 
        @items = []
    end 

    def total
        @total 
    end 

    def add_item(name, price, quantity=1)
        self.total += price * quantity
        @items.concat([name]*quantity) #concat adds the name quantity amount of times 
        @previous_item_total = price * quantity 
    end 

    def apply_discount
        if @discount > 0
            @total = (@total * ((100 - @discount.to_f)/100)).to_i
            # binding.pry
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end 
    end 

    def items 
        @items 
    end 

    def void_last_transaction
        if @previous_item_total != nil 
            @total = @total - @previous_item_total
        else 
            @total = 0.0
        end 
    end 


end 
