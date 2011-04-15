require 'spec_helper'

describe Message do
 it { should belong_to :person }

 context "It should have default status set" do
   before do
    @message = Message.create!(:content => "Test Message")
   end
   it "should have default status set to unread" do
     @message.status.should == "unread"
   end
 end
end