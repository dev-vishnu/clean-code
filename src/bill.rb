class Bill

  attr_accessor :item_list , :sales_tax, :total_amount

  def initialize(item_list,sales_tax,total_amount)
    @item_list = item_list
    @sales_tax = sales_tax
    @total_amount = total_amount
  end

  def get_bill
    {
     item_list: @item_list,
     sales_tax: @sales_tax,
     total_amount: @total_amount
    }
  end

  def print
    @item_list.each do |item|
      puts "#{item[:quantity]}#{item[:is_imported] ? " imported":""} #{item[:category]}"
    end
    puts "Sales Tax: #{@sales_tax}"
    puts "Total: #{@total_amount}"
  end
end