require 'spec_helper'

describe Address do
  it {should belong_to(:location) }
  it {should belong_to(:user) }
  it {should have_many(:charges) }
end
