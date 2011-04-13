class Story < ActiveRecord::Base
  belongs_to :project
  before_create :setDefaults
  has_one :person

  validates :weight, :presence => true, :numericality => true
  validates :title, :presence => true, :uniqueness => true

  def setDefaults

  end
end



# == Schema Information
#
# Table name: stories
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :string(255)
#  project_id  :integer
#  weight      :integer
#  person_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#  status      :string(255)
#

