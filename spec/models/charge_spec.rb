require 'spec_helper'

describe Charge do
  let(:charge) { FactoryGirl.create(:charge, address_line_1: "123 Street", address_line_2: "Apt 1", city: "Townes", zip: '1234', country: 'Australia') }

  it { should have_many(:cart_items) }
  it { should belong_to(:address) }
  it { should belong_to(:user) }

  it "should return the amount in dollars" do
    expect(charge.amount_in_dollars).to eq(20)
  end

  it "should save the shipping address association" do
    charge.save_shipping_address
    expect(charge.address.address_line_1).to eq("123 Street")
  end

  # charge_card tested in feature spec

end
