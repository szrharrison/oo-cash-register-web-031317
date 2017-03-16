require 'pry'

class CashRegister
  def initialize( discount = 0 )
    @total = 0
    @discount = discount
    @items = []
  end

  attr_reader :discount, :items
  attr_accessor :total, :last_transaction

  def add_item( item, price, quantity = 1 )
    self.last_transaction = 0
    quantity.times do
      self.total += price
      self.last_transaction += price
      self.items << item
    end

  end

  def apply_discount
    self.total = self.total * ( 100 - @discount ) / 100
    if self.total != 0
      "After the discount, the total comes to $#{ self.total }."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end
end
