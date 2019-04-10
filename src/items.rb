require_relative '../src/tax'

class Item

  attr_accessor :category, :price, :is_imported, :tax

  EXEMPTED_ITEMS = ["books","food", "medical_products"]

  def initialize(category, price, is_imported)
    @category = category
    @price = price
    @is_imported = is_imported
    @tax = 0.0
  end


  def get_total_tax
    @tax += get_basic_tax
    @tax += get_import_tax
  end


  def get_basic_tax
    return Tax.get_basic_tax_from(@price) unless is_exempted
    return 0
  end


  def get_import_tax
    return Tax.get_import_tax_from(@price) if is_imported
    return 0
  end

  def is_exempted
    EXEMPTED_ITEMS.include?(@category)
  end

end