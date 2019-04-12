require_relative '../src/tax'

class Item

  attr_accessor :category, :price, :is_imported, :tax, :quantity

  EXEMPTED_ITEMS = ["books","food", "medical_products"]

  def initialize(category, price, is_imported, quantity)
    @category = category
    @price = price
    @is_imported = is_imported
    @tax = 0.0
    @quantity = quantity
  end


  def get_total_tax
    @tax += get_basic_tax
    @tax += get_import_tax
    @tax = @tax*@quantity
  end

  def get_details
    {
        :category => @category,
        :price => @price,
        :quantity => @quantity,
        :is_imported => @is_imported,
    }
  end

  def description
    "#{@quantity} #{@is_imported ? "imported":""} #{@category}: #{@price}"
  end


  def get_basic_tax
    is_exempted ? 0:Tax.get_basic_tax_from(@price)
  end

  def get_total_amount
    get_total_price + get_total_tax
  end

  def get_total_price
    @price*@quantity
  end

  def get_import_tax
    is_imported ? Tax.get_import_tax_from(@price):0
  end

  def is_exempted
    EXEMPTED_ITEMS.include?(@category)
  end

end