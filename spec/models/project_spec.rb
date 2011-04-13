require 'spec_helper'

describe Project do
  it { should have_many :stories }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end
# == Schema Information
#
# Table name: projects
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  points      :integer         default(0)
#  person_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

