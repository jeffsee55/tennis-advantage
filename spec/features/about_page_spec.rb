require 'spec_helper'

describe "The about page" do

  describe "post" do
    # The controller looks for the 'last' post with page: 'About' so need to persist with let!
    let!(:post) { create(:post, page: "About") }
    let!(:user) { create(:user, admin: true) }

    it "should have the About post" do
      visit about_path

      expect(page).to have_content(post.body)
    end

    it "should have staff" do
      visit about_path

      expect(page).to have_content(user.full_name)
    end
  end

end
