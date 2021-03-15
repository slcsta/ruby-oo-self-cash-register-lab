require "pry"

class CashRegister
    attr_accessor :total, :discount, :add_item, :apply_discount, :items, :last_transaction

    def initialize(discount=0)
        @total = 0.0
        @discount = discount
        @items=[]
        @last_transaction = 0.0
        @last_transaction_name = nil
    end

    def add_item(title, price, quantity = 1)
        @title = title
        @price = price
        @quantity = quantity

        if quantity > 0
            self.total += price * quantity
            @items << ("#{title}," * quantity).split(",")
            @items.flatten!
            @last_transaction = price
            @last_transaction_name = title
        else
            self.total += price
            @items << title
        end
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."

        else 
            self.total -= self.total * (self.discount/100.0)
            "After the discount, the total comes to $#{self.total.round}."
        end
    end

    def void_last_transaction
        @items.delete(@last_transaction_name)
        if @items.empty?
            self.total = 0.0

        else
            self.total -= @last_transaction
        end
    end

end