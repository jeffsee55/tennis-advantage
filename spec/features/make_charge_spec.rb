require 'spec_helper'
require 'stripe_mock'

describe "When going through the checkout process" do
  let(:user) { create(:user) }
  let(:product) { create(:product) }

  context "in the cart view" do
    describe "the user's cart" do
      before :each do
        visit product_path(product)
        sign_in(user)

        populate_cart(user, product)
      end
      it "should have the correct cart items" do
        expect(user.cart_items.last.product).to eq(product)
      end
      it "should have the correct amount of cart items" do
        expect(user.cart_items.count).to eq(1)
      end
    end
  end
  context "in the charge view" do
    before :each do
      visit product_path(product) # So that it redirects to a page with instance variables present
      sign_in(user)

      populate_cart(user, product)
      visit new_charge_path(user)
    end
    it "should show the cart sub-total" do
      expect(page).to have_content(product.price)
    end
    it "should show the credit card form" do
      expect(page).to have_content("Credit Card Number")
    end
    describe "when charging a valid credit card" do
      let(:stripe_helper) { StripeMock.create_test_helper }

      it "should create a new charge record" do


        within(".new_charge") do
          click_on("Submit")
        end

        expect(Charge.count).to eq(2)
      end

      let(:stripe_helper) { StripeMock.create_test_helper }
      before { StripeMock.start }
      after { StripeMock.stop }

      it "creates a stripe customer" do

        # This doesn't touch stripe's servers nor the internet!
        customer = Stripe::Customer.create({
          email: 'johnny@appleseed.com',
          card: stripe_helper.generate_card_token
        })
        expect(customer.email).to eq('johnny@appleseed.com')
      end

      it "should redirect to the charge summary" do
      end
    end
    describe "when charging an invalid credit card" do
    end
  end
end
