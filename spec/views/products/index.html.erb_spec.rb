require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :name => "Name",
        :insect_type => "Insect Type",
        :time_of_year => "Time Of Year",
        :fish => "Fish",
        :description => "MyText"
      ),
      stub_model(Product,
        :name => "Name",
        :insect_type => "Insect Type",
        :time_of_year => "Time Of Year",
        :fish => "Fish",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Insect Type".to_s, :count => 2
    assert_select "tr>td", :text => "Time Of Year".to_s, :count => 2
    assert_select "tr>td", :text => "Fish".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
