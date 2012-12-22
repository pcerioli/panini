require 'spec_helper'

describe "sandwiches/edit" do
  before(:each) do
    @sandwich = assign(:sandwich, stub_model(Sandwich,
      :name => "MyString",
      :description => "MyString",
      :image => "MyString"
    ))
  end

  it "renders the edit sandwich form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sandwiches_path(@sandwich), :method => "post" do
      assert_select "input#sandwich_name", :name => "sandwich[name]"
      assert_select "input#sandwich_description", :name => "sandwich[description]"
      assert_select "input#sandwich_image", :name => "sandwich[image]"
    end
  end
end
