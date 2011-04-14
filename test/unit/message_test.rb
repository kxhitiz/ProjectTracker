require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  person_id  :integer
#  project_id :integer
#  story_id   :integer
#

