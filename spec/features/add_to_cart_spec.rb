require 'spec_helper'

describe "The shopping process" do
  let!(:product) { create(:product, name: "New Product") }
  let!(:user) { create(:user) }

  context "when viewing all products" do
    describe "clicking View on a product" do
      it "should redirect to the product" do
        visit products_path
        click_link "View"

        expect(page).to have_selector("input[type=submit][value='Add To Cart']")
      end
    end
  end

  context "when adding the product to cart" do
    context "when the user is not signed in" do
      it "should redirect to the sign in page" do
        visit product_path(product)
        click_button 'Add To Cart'

        expect(page).to have_content('Please sign in')
      end

      context "after signing in" do
        it "should redirect back to the product page" do
          visit product_path(product)
          click_button 'Add To Cart'

          within('.form-inputs') do
            fill_in "Email", with: user.email
            fill_in "Password", with: user.password
          end
          click_button('Sign in')

          expect(page).to have_content(product.name)
        end
      end
    end
    context "when the user is signed in" do
      before(:each) do
        visit product_path(product)
        sign_in(user)

        click_button 'Add To Cart'
      end
      it "should add item to user's cart" do
        expect(user.cart_items.last.product).to eq(product)
      end

      it "should redirect to the user's cart" do
        expect(page).to have_content("#{user.first_name}'s Cart")
      end
    end
  end
end
