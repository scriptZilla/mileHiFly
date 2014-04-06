require 'spec_helper'

describe UserSessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "renders the new template properly" do
      get 'new'
      expect(response).to render_template('new')
    end
  end

  describe "POST 'create'" do
    context "with proper credentials" do
     let!(:user) { User.create(first_name: "Ralph", last_name: "Wiggum", email: "wiggum@springfield.com", password: "somePass", password_confirmation: "somePass")}
   
      it "redirects the user to the blog controller" do
        post :create, email: "wiggum@springfield.com", password: "somePass"
        expect(response).to be_redirect
        expect(response).to redirect_to(posts_path)
      end
    
      it "can authenticate a user" do
        User.stub(:find_by).and_return(user)
        expect(user).to receive(:authenticate)
        post :create, email: "wiggum@springfield.com", password: "somePass" 
      end
    end
  end
end
