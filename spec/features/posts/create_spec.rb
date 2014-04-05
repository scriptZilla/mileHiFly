require 'spec_helper'

describe "Creating posts" do
  it "redirects to the posts index page on success" do
    visit "/posts"
    click_link "New Post"
    expect(page).to have_content("New post")

    fill_in "Title", with: "Fly fishin"
    fill_in "Content", with: "rainbow brown cutt throat"
    click_button "Create Post"

    expect(page).to have_content("Post was successfully created")
  end

  it "displays an error when the post has no title" do
    expect(Post.count).to eq(0)
 
    visit "/posts"
    click_link "New Post"
    expect(page).to have_content("New post")

    fill_in "Title", with: ""
    fill_in "Content", with: "rainbow brown cutt throat"
    click_button "Create Post"
 
    expect(page).to have_content("error")
    expect(Post.count).to eq(0)

    visit "/posts"
    expect(page).to_not have_content("rainbow brown cutt throat")
  end

  it "displays an error when the new post has no actual content" do
    expect(Post.count).to eq(0)
    visit "/posts"
    click_link "New Post"
    expect(page).to have_content("New post")

   fill_in "Title", with: "Fly fishin'"
    fill_in "Content", with: ""
    click_button "Create Post"
    
    expect(page).to have_content("error")
    expect(Post.count).to eq(0)

    visit "/posts"
    expect(page).to_not have_content("Fly fishin'")
  end
end
