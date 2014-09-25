require 'spec_helper'

describe "Homepage" do
  describe "Home page latest Posts" do
    it "should have the most recent news" do
      post = create(:post, body: "Latest Post", tags: "News")
      visit root_path
      expect(page).to have_content(post.body)
    end
  end
end
