class Connection < ActiveRecord::Base
  validates :person_id, :presence => true
  validates :project_id, :presence => true
  belongs_to :person
  belongs_to :project

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

