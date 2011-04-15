require 'spec_helper'

describe Story do
  it { should belong_to :person }
  it { should belong_to :project}
  it { should validate_presence_of(:weight)}
  it { should validate_presence_of(:title)}

  before do
    @story = Story.create!(:title => "New Story", :description => "New Story description", :weight => 3)
  end

  context "Title set after creating a story" do
    it "should not have title blank" do
      @story.title.should_not == ""
    end
  end

  context "Weight after the story creation" do
    it"should have weight set" do
      @story.weight.should == 3
    end
  end

  context "When a story is created,it should have default status" do
    it "should have default status" do
      @story.status.should == "Not Yet Started"
    end
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

