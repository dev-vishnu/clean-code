require_relative '../src/cart'
require_relative '../src/items'

describe "testing cart" do
  it "should add item to the cart" do
    cart = Cart.new()
    item1 = Item.new("food",50,true)
    item2 = Item.new("books",50,false)
    item3 = Item.new("beverages",100,true)
    items = [item1,item2,item3]
    items.each do |item|
      cart.addItem(item)
    end
    expect(cart.items.count).to eql(3)
  end

  it "should return the total tax for the list of items " do
    cart = Cart.new()
    item1 = Item.new("food",50,true)
    item2 = Item.new("books",50,false)
    item3 = Item.new("beverages",100,true)
    items = [item1,item2,item3]
    items.each do |item|
      cart.addItem(item)
    end
    expect(cart.get_total_tax).to eql(17.5)
  end
end