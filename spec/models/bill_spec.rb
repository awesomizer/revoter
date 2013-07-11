require 'spec_helper'

describe Bill do
  it {should have_many(:votes)}
  it {should validate_presence_of(:sun_bill_id)}
end
