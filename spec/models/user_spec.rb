require 'spec_helper'

describe User do
  it {should have_many(:addresses)}
  it {should have_many(:charges)}
  it {should have_many(:cart_items)}
  it {should have_many(:products)}

  it {should validate_presence_of(:first_name)}

  let(:user) { create(:user) }

  it "should have a full name" do
    expect(user.full_name).to eq("Jeff See")
  end

  it "should have a valid truncated description" do
    user.description
  end

  context "when showing cart items" do
    let(:cart_item) { create(:cart_item, user_id: user.id, purchased: false)}
    let(:product) { create(:product, price: 20)}

    it "should show new items" do
      expect(user.new_cart).to include(cart_item)
    end

    it "should not show items that have been purchased" do
      cart_item.update_attributes(purchased: true)

      expect(user.new_cart).to_not include(cart_item)
    end

    it "should get the cart total" do
      cart_item.update_attributes(product_id: product.id)

      expect(user.cart_total).to eq(20)
    end

    it "should dispay cart_total in cents" do
      cart_item.update_attributes(product_id: product.id)

      expect(user.cart_total_in_cents).to eq(2000)
    end

    it "should reset cart after successful charge" do
      user.reset_cart

      expect(cart_item.purchased).to be_false
    end
  end

  it "should be able to become an admin" do
    user.make_admin

    expect(user.admin).to be_true
  end
end
