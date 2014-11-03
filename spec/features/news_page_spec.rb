require 'spec_helper'

describe "news page" do
  let!(:post) { create(:post, context: "News", body: "This is the most recent news") }

  it "should have the most recent news" do
    visit news_path

    expect(page).to have_content(post.body)
  end
end
