require_relative '../src/items'

class Cart

 attr_accessor :items, :total_tax

 def initialize
   @items = []
   @total_tax = 0.0
 end

 def addItem(item)
   @items.push(item)
 end

 def get_total_tax
   @items.each do |item|
     @total_tax += item.get_total_tax
   end
   @total_tax
 end
end