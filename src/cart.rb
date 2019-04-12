require_relative '../src/items'
require_relative '../src/bill'

class Cart

 attr_accessor :items, :total_tax, :total, :bill

 def initialize
   @items = []
   @total_tax = 0.0
   @total = 0.0
   @bill = {}
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

  def get_total
    @items.each do |item|
      @total += item.get_total_amount
    end
    @total
  end


 def get_items_details
   items_details = @items.map do |item|
     item.get_details
   end
 end

 def generate_bill
   @bill = Bill.new(get_items_details,get_total_tax,get_total)
 end

 def print_bill
   @bill.print
 end
end