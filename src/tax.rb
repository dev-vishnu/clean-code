class Tax

  BASIC_TAX = 10.0
  IMPORT_TAX = 5.0

  def self.basic_tax
    BASIC_TAX
  end
  
  def self.import_tax
    IMPORT_TAX
  end

  def self.get_basic_tax_from(price)
    (price*BASIC_TAX)/100.0
  end

  def self.get_import_tax_from(price)
    (price*Tax.import_tax)/100.0
  end

end