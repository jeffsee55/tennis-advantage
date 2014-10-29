class Charge < ActiveRecord::Base
  has_many :cart_items
  belongs_to :address
  belongs_to :user

  attr_accessor :stripe_card_token, :address_line_1, :address_line_2, :city, :state, :zip, :country, :cart_items

  def charge_card
    user = User.find(user_id)
    if valid?
      Stripe::Charge.create(
        :amount => amount,
        :currency => "usd",
        :card => stripe_card_token, # obtained with Stripe.js
        :description => "Charge for #{user.first_name}",
      )
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating charge: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

  def amount_in_dollars
    self.amount / 100
  end

  def save_shipping_address
    address = Address.create(
      address_line_1: address_line_1,
      address_line_2: address_line_2,
      city: city,
      state: state,
      zip: zip
    )
    self.address_id = address.id
  end
end
