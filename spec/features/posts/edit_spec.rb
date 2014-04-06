require "spec_helper"

describe "Editing posts" do
   let!(:post){ Post.create(title: "Streamer", content: "Spring Pattern")}
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

   it "Displays an error with no title" do
     update_post post: post, title: ""
     title = post.title
     post.reload
     expect(post.title).to eq(title)
     expect(page).to have_content("error")
   end

   it "Displays an error when too short a title is passed" do
     update_post post: post, title: "b"
     expect(page).to have_content("error")
   end

   it "Displays an error with no content" do
     update_post post: post, content: ""
     expect(page).to have_content("error")
   end

   it "Displays an error when content section is too brief" do
     update_post post: post, content: "12345678"
     expect(page).to have_content("error")
   end
end
