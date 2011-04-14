class Message < ActiveRecord::Base
  belongs_to :person

  def changeStatus
    self.status = "read"
    self.save
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

