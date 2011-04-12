require 'spec_helper'

describe Project do
  it { should have_many :stories }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end