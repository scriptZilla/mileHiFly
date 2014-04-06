require 'spec_helper'

describe "Deleting a post" do
  let!(:post) { Post.create(title: "Streamer", content: "Spring Pattern")}

  it "is successful when clicking the destroy link" do
    visit "/posts"

    within "#post_#{post.id}" do
      click_link "Destroy"
    end
   
    expect(page).to_not have_content(post.title)
    expect(Post.count).to eq(0)
  end
end
