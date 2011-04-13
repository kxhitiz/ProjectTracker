class Project < ActiveRecord::Base
  has_many :stories, :dependent => :destroy
  has_many :person, :through => :connection

  validates :title, :presence => true
  validates :description, :presence => true
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

