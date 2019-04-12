require_relative '../src/bill'
require_relative '../src/items'
require_relative '../src/cart'

describe "testing billing" do
  it "should return the bill json" do
      cart = Cart.new()
      item1 = Item.new("food",50,true,1)
      item2 = Item.new("books",50,false,2)
      item3 = Item.new("beverages",100,true,3)
      items = [item1,item2,item3]
      items.each do |item|
        cart.addItem(item)
      end
      bill = cart.generate_bill
      expected_bill = {
          :item_list=>[{:category=>"food", :price=>50, :quantity=>1, :is_imported=>true},
                       {:category=>"books", :price=>50, :quantity=>2, :is_imported=>false},
                       {:category=>"beverages", :price=>100, :quantity=>3, :is_imported=>true}],
          :sales_tax=>47.5,
          :total_amount=>635.0
      }
      expect(bill.get_bill).to eql(expected_bill)
  end

end