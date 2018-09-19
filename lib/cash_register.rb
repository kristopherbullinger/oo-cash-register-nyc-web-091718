require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :item_information


  def initialize(discount=0, items = [], item_information = [])
    @total = 0
    @discount = discount
    @item_information = item_information
    @items = items
  end

  def add_item(item_name, price, quantity = 1)
    @total += price * quantity
    @item_information << [item_name, price, quantity]
    quantity.times do
      @items << item_name
    end
  end

  def apply_discount
    @total = @total * (1 - @discount/100.0)
    return @discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{@total.to_i}."
  end

  def void_last_transaction
    @total = @total.to_f - @item_information.last[1]*@item_information.last[2]
    @items.delete_if {|food_name| food_name == @item_information.last[0]}
    @item_information.pop
    @total = @total.to_i
  end

end
