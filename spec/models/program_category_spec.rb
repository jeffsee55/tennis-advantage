require 'spec_helper'

describe ProgramCategory do
  it {should have_many(:programs)}
end
