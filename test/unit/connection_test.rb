require 'test_helper'

class ConnectionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: connections
#
#  id         :integer         not null, primary key
#  person_id  :integer
#  project_id :integer
#  types      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

