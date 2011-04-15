require 'spec_helper'

describe Project do
  it { should have_many :stories }
  it { should have_many :people }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }

  before do
    @project = Project.create!(:title => "Sprout Notes" , :description => "This is sprout note")
  end

  context "Testing for title set after creating a project" do
    it "should have title set to Sprout Notes" do
      @project.title.should_not == ""
      @project.title.should == "Sprout Notes"
    end
  end

  context "Testing for description set after creating a project" do
    it "should have description set to This is sprout note" do
      @project.description.should == "This is sprout note"
    end
  end

  context "Testing for default value set after a new project is created" do
    it "should have default value of points set to zero but not nil" do
      @project.points.should_not == nil
      @project.points.should == 0
    end
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

