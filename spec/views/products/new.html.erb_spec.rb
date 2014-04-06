require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :insect_type => "MyString",
      :time_of_year => "MyString",
      :fish => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", products_path, "post" do
      assert_select "input#product_name[name=?]", "product[name]"
      assert_select "input#product_insect_type[name=?]", "product[insect_type]"
      assert_select "input#product_time_of_year[name=?]", "product[time_of_year]"
      assert_select "input#product_fish[name=?]", "product[fish]"
      assert_select "textarea#product_description[name=?]", "product[description]"
    end
  end
end
