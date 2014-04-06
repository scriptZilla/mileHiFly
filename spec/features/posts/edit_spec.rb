require "spec_helper"

 describe "Editing posts" do

   def update_post(options={})
     options[:title] ||= "Roll Cast"
     options[:content] ||= "Use for tight trees"

     post = options[:post]

     visit "/posts"
     within "#post_#{post.id}" do
       click_link "Edit"
     end

     fill_in "Title", with: options[:title]
     fill_in "Content", with: options[:content]
     click_button "Update Post"
   end

   it "Updates an edited post" do
     post = Post.create(title: "Streamer", content: "Spring Pattern")
     update_post post: post, 
                 title: "Some New Title",
                 content: "Some New Content"
     post.reload
 
     expect(page).to have_content("Post was successfully updated")
     expect(post.title).to eq("Some New Title")
     expect(post.content).to eq("Some New Content")
     
     expect(page).to_not have_content("Streamer")
     expect(page).to_not have_content("Spring Pattern")
   end
end
