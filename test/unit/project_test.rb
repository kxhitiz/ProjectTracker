require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

