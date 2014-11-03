require 'spec_helper'

describe "Homepage" do
  let!(:welcome_message) { create(:post, context: "News") }
  let!(:tagline) { create(:post, page: "Home", context: "Tagline") }
  let!(:philosophy) { create(:post, context: "Philosophy") }
  let!(:inquiry) { create(:inquiry) }

  it "should have the most recent news" do
    visit root_path

    expect(page).to have_content(welcome_message.body)
  end

  it "should have a tagline" do
    visit root_path

    expect(page).to have_content(tagline.body)
  end

  it "should have a philosophy post" do
    visit root_path

    expect(page).to have_content(philosophy.body)
  end

  it "should have an inquiry form" do
    visit root_path

    expect(page).to have_selector("input[id='inquiry_name']")
  end
end
