require "spec_helper"

 describe "Editing posts" do
   it "Updates an edited post" do
     visit "/posts"
     post = Post.create(title: "Fly fishin'", content: "rainbow brown cut throat")     

     visit "/posts"
     within "#post_#{post.id}" do
       click_link "Edit"
     end

     fill_in "Title", with: "Some New Title"
     fill_in "Content", with: "Some New Content"
     click_button "Update Post"

     post.reload
 
     expect(page).to have_content("Post was successfully updated")
     expect(post.title).to eq("Some New Title")
     expect(post.content).to eq("Some New Content")
   end
end
