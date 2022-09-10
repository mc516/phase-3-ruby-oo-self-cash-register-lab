class CashRegister
    attr_reader :total, :discount, :items
    attr_accessor :total

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity = 1)
        i = 0

        while i < quantity do 
            @items << title
            @last_transaction = price * quantity
            @last_transaction_name = title
            @price = price
            i += 1
        end

        self.total += price * quantity
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total -=  (self.total * (self.discount / 100.0))
            "After the discount, the total comes to $#{self.total.round}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        items.delete(@last_transaction_name)
        if items.empty?
            self.total = 0.0
        else
            self.total -= @last_transaction
        end
    end

end
