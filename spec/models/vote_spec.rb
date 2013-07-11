require 'spec_helper'

describe Vote do
  it {should belong_to(:bill)}
  it {should have_and_belong_to_many(:legislators)}
  it {should validate_presence_of(:roll_id)}
  it {should validate_uniqueness_of(:roll_id)}
end
