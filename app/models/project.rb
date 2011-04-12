class Project < ActiveRecord::Base
  has_many :stories

  validates :title, :presence => true
  validates :description, :presence => true
  validates :person_id, :presence => true
end


# == Schema Information
#
# Table name: projects
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  points      :integer
#  person_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

