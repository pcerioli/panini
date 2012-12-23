require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :client_name => "MyString",
      :variation => "MyText"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path, :method => "post" do
      assert_select "input#order_client_name", :name => "order[client_name]"
      assert_select "textarea#order_variation", :name => "order[variation]"
    end
  end
end
