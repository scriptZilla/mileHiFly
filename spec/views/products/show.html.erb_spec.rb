require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "Name",
      :insect_type => "Insect Type",
      :time_of_year => "Time Of Year",
      :fish => "Fish",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Insect Type/)
    rendered.should match(/Time Of Year/)
    rendered.should match(/Fish/)
    rendered.should match(/MyText/)
  end
end
