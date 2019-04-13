class Bill

  attr_accessor :item_list, :total_sales_tax, :total_amount

  def initialize(item_list)
    @item_list = item_list
    @total_sales_tax = 0.0
    @total_amount = 0.0

    @item_list.each do |item|
      @total_sales_tax += item[:total_sales_tax]
      @total_amount += item[:total_amount]
    end
  end

  def get_bill
    {
     item_list: @item_list,
     total_sales_tax: @total_sales_tax,
     total_amount: @total_amount
    }
  end

  def print
    @item_list.each do |item|
      puts "#{item[:quantity]}#{item[:is_imported] ? " imported":""} #{item[:category]}"
    end
    puts "Sales Tax: #{@total_sales_tax}"
    puts "Total: #{@total_amount}"
  end
end