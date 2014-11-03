require 'spec_helper'

describe Product do
  it {should have_many(:cart_items)}
  it {should have_many(:users)}
end
