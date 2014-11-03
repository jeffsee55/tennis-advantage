module CheckoutHelpers
  def populate_cart(user, product)
    FactoryGirl.create(:cart_item, product_id: product.id, user_id: user.id)
  end
end
