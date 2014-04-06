require 'spec_helper'



describe "Signing Up" do
  
  #def 
    # visit "/"
    # expect(page).to have_content("Sign Up")
    # click_link "Sign Up"
  #end

  it "allows a ser to sign up for the site and creates the object in the database" do
    expect(User.count).to eq(0)

    visit "/"
    expect(page).to have_content("Sign Up")
    click_link "Sign Up"

    fill_in "First Name", with: "Ralph"
    fill_in "Last Name", with: "Wiggum"
    fill_in "Email", with: "wiggum@springfield.com"
    fill_in "Password", with: "somePass"
    fill_in "Password Confirmation", with: "somePass"
    click_button "Sign Up"

    expect(User.count).to eq(1)
  end
end  

