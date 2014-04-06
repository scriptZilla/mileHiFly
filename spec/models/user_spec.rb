require 'spec_helper'

describe User do
  let(:valid_attributes) {
  {
    first_name: "Ralph",
    last_name: "Wiggum",
    email: "wiggum@springfield.com"
#    password: "wuTang123!"
#    password_confirmation: "wuTang123!"
  }
  }
 
  context "validations" do
    let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it "Requires an email" do
      expect(user).to validate_presence_of(:email)
    end

    it "Requires the user's email to be unique" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "Ensures an email is lower case before saving" do
      user.email = "WIGGUM@SPRINGFIELD.COM"
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a properly formatted email address, regardless of case." do
      user.email = "ralphie"
      expect(user).to_not be_valid
    end

  end

  describe "#downcase_email" do
    it "makes the email attribute lower-case" do
      user = User.new(valid_attributes.merge(email: "WIGGUM@SPRINGFIELD.COM"))
      expect{ user.downcase_email }.to change{ user.email }.
	from("WIGGUM@SPRINGFIELD.COM").
	to("wiggum@springfield.com")
    end

    it "downcases the email before saving to the database" do
      user = User.new(valid_attributes)
      user.email = "RALPH@SPRINGFIELD.COM"
      expect(user.save).to be_true
      expect(user.email).to eq("ralph@springfield.com")
    end
  end
end
