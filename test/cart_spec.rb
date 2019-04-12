require_relative '../src/cart'
require_relative '../src/items'

describe "testing cart" do
  it "should add item to the cart" do
    cart = Cart.new()
    item1 = Item.new("food",50,true,1)
    item2 = Item.new("books",50,false,1)
    item3 = Item.new("beverages",100,true,1)
    items = [item1,item2,item3]
    items.each do |item|
      cart.addItem(item)
    end
    expect(cart.items.count).to eql(3)
  end

  it "should return the total tax for the list of items " do
    cart = Cart.new()
    item1 = Item.new("food",50,true,1)
    item2 = Item.new("books",50,false,1)
    item3 = Item.new("beverages",100,true,1)
    items = [item1,item2,item3]
    items.each do |item|
      cart.addItem(item)
    end
    expect(cart.get_total_tax).to eql(17.5)
  end

  it "should return the total amount of the cart including the taxes" do
    cart = Cart.new()
    item1 = Item.new("food",50,true,1)
    item2 = Item.new("books",50,false,1)
    item3 = Item.new("beverages",100,true,1)
    items = [item1,item2,item3]
    items.each do |item|
      cart.addItem(item)
    end
    expect(cart.get_total).to eql(217.5)
  end

  it "should return the total amount of the cart including the taxes for different quantities of item " do
    cart = Cart.new()
    item1 = Item.new("food",50,true,1)
    item2 = Item.new("books",50,false,2)
    item3 = Item.new("beverages",100,true,3)
    items = [item1,item2,item3]
    items.each do |item|
      cart.addItem(item)
    end
    expect(cart.get_total).to eql(497.5)
  end

  it "should return the total amount of the cart including the taxes for different quantities of item " do
    cart = Cart.new()
    item1 = Item.new("food",50,true,1)
    item2 = Item.new("books",50,false,2)
    item3 = Item.new("beverages",100,true,3)
    items = [item1,item2,item3]
    items.each do |item|
      cart.addItem(item)
    end
    cart.generate_bill
    cart.print_bill
  end

end