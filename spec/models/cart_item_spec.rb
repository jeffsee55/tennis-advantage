require 'spec_helper'

describe CartItem do
  it { should belong_to(:user) }
  it { should belong_to(:product) }
  it { should belong_to(:charge) }
end
