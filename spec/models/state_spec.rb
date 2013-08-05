require 'spec_helper'

describe State do
  it {should have_many(:legislators)} 
  it {should validate_presence_of(:code)} 
  it {should validate_uniqueness_of(:code)} 
  it {should validate_presence_of(:name)} 
  it {should validate_presence_of(:population)} 
end
