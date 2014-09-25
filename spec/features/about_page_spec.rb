require 'spec_helper'

describe "The about page" do

  describe "post" do
    before do
      @post = FactoryGirl.create(:post, tags: 'About')
    end
    it "should have title About" do
      visit page_path('about')
      expect(page).to have_content(@post.body)
    end
  end

end
