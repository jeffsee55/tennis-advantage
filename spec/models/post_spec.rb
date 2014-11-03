require 'spec_helper'

describe Post do
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }

  let(:post) { create(:post, body: "Test"*100 ) }

  it "should have a valid post excerpt" do
    length = post.post_excerpt.length

    expect(length).to eq(250)
  end
end
