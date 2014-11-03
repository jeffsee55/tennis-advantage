require 'spec_helper'

describe "Programs Index page" do
  let!(:old_post) { create(:post, page: "Programs")}
  let!(:new_post) { create(:post, page: "Programs", body: "This is the newer post")}

  let!(:hotshots) { create(:program_category)}
  let!(:hotshots_program) { create(:program, program_category_id: hotshots.id)}

  it "should contain the latest post about programs" do
    visit programs_path

    expect(page).to have_content(new_post.body)
  end

  it "should have programs in the right program categories" do
    visit programs_path

    within('.program-category') do
      expect(page).to have_content(hotshots_program.name)
    end
  end

end
