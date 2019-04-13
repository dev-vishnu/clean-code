require_relative '../src/item'

describe "testing items class" do

  it "should check if the books is exempted or not" do
    item1 = Item.new("books",10,false,1)
    expect(item1.is_exempted).to eql(true)
  end

  it "should check if the food is exempted or not" do
    item1 = Item.new("food",10,false,1)
    expect(item1.is_exempted).to eql(true)
  end

  it "should check if the medical products is exempted or not" do
    item1 = Item.new("medical_products",10,false,1)
    expect(item1.is_exempted).to eql(true)
  end

  it "should check if the beverages is exempted or not" do
    item1 = Item.new("beverages",10,false,1)
    expect(item1.is_exempted).to eql(false)
  end

  it "should return the basic tax if not exempted" do
    item1 = Item.new("beverages",10,false,1)
    expect(item1.get_basic_tax).to eql(1.0)
  end

  it "should return the basic tax as 0 if exempted" do
    item1 = Item.new("food",10,false,1)
    expect(item1.get_basic_tax).to eql(0)
  end

  it "should return the import tax if imported" do
    item1 = Item.new("food",10,true,1)
    expect(item1.get_import_tax).to eql(0.5)
  end

  it "should return the import tax as 0 if not imported" do
    item1 = Item.new("food",10,false,1)
    expect(item1.get_import_tax).to eql(0)
  end

  it "should return the total tax for the item which is neither imported nor exempted" do
    item1 = Item.new("beverages",10,false,1)
    expect(item1.get_total_tax).to eql(1.0)
  end

  it "should return the total tax for the item which is  imported but not exempted" do
    item1 = Item.new("beverages",10,true,1)
    expect(item1.get_total_tax).to eql(1.5)
  end

  it "should return the total tax for the item which is imported and exempted" do
    item1 = Item.new("food",10,true,1)
    expect(item1.get_total_tax).to eql(0.5)
  end

  it "should return the total tax for the item which is not imported but exempted" do
    item1 = Item.new("food",10,false,1)
    expect(item1.get_total_tax).to eql(0.0)
  end

  it "should return the quantity of the item" do
    item1 = Item.new("food",10,false,2)
    expect(item1.quantity).to eql(2)
  end

  it "should return the total tax for multiple items of same type when exempted and not imported" do
    item1 = Item.new("food",10,false,2)
    expect(item1.get_total_tax).to eql(0.0)
  end

  it "should return the total tax for multiple items of same type when exempted and not imported" do
    item1 = Item.new("food",10,true,2)
    expect(item1.get_total_tax).to eql(1.0)
  end

  it "should return the total tax for multiple items of same type when not exempted and not imported" do
    item1 = Item.new("beverages",10,true,2)
    expect(item1.get_total_tax).to eql(3.0)
  end

  it "should return the total tax for multiple items of same type when not exempted and not imported" do
    item1 = Item.new("beverages",10,true,2)
    expect(item1.get_total_amount).to eql(23.0)
  end
end