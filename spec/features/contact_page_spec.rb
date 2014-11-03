require 'spec_helper'

describe "The contact page" do
  let!(:old_post) { create(:post, page: 'Contact') }
  let!(:new_post) { create(:post, page: 'Contact', body: "this is the new post") }

  it "should have the latest post about contacts" do
    visit contact_path

    expect(page).to have_content(new_post.body)
  end

  it "should not have the earlier post about contacts" do
    visit contact_path

    expect(page).to_not have_content(old_post.body)
  end

end
