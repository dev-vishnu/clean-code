require_relative '../src/bill'
require_relative '../src/item'
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
      bill = Bill.new(cart.get_items_details)
      expected_bill = {
          :item_list=>[{:category=>"food", :price=>50, :quantity=>1, :is_imported=>true, :total_sales_tax=>item1.get_total_tax, :sales_tax=> item1.get_tax, :total_amount=>item1.get_total_amount},
                       {:category=>"books", :price=>50, :quantity=>2, :is_imported=>false,:total_sales_tax=>item2.get_total_tax,:sales_tax=> item2.get_tax, :total_amount=>item2.get_total_amount},
                       {:category=>"beverages", :price=>100, :quantity=>3, :is_imported=>true,:total_sales_tax=>item3.get_total_tax,:sales_tax=> item3.get_tax, :total_amount=>item3.get_total_amount}],
          :total_sales_tax=> bill.total_sales_tax,
          :total_amount=> bill.total_amount
      }
      expect(bill.get_bill).to eql(expected_bill)
  end

end