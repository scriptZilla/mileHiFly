require 'spec_helper'

describe "Creating posts" do

  def create_post(options={})
    options[:title] ||= "Fly Fishin'"
    options[:content] ||= "rainbow brown cutt throat"

    visit "/posts"
    click_link "New Post"
    expect(page).to have_content("New post")

    fill_in "Title", with: options[:title]
    fill_in "Content", with: options[:content]
    click_button "Create Post"
  end


  it "redirects to the posts index page on success" do

    create_post

    expect(page).to have_content("Post was successfully created")
  end

  it "displays an error when the post has no title" do
    expect(Post.count).to eq(0)
 
    create_post title: ""
 
    expect(page).to have_content("error")
    expect(Post.count).to eq(0)

    visit "/posts"
    expect(page).to_not have_content("rainbow brown cutt throat")
  end

  it "displays an error when the new post has a title that is too short" do
    expect(Post.count).to eq(0)

    create_post title: "b"

    expect(page).to have_content("error")
    expect(Post.count).to eq(0)
    
    visit "/posts"
    expect(page).to_not have_content("rainbow brown cutt throat")
  end

  it "displays an error when the new post has no actual content" do
    expect(Post.count).to eq(0)

    create_post content: ""

    expect(page).to have_content("error")
    expect(Post.count).to eq(0)

    visit "/posts"
    expect(page).to_not have_content("Fly fishin'")
  end

  it "displays an error when the new post has too little content" do
    expect(Post.count).to eq(0)

    create_post content: "12345678"

    expect(page).to have_content("error")
    expect(Post.count).to eq(0)
    
    visit "/posts"
    expect(page).to_not have_content("123456789")
  end
end
