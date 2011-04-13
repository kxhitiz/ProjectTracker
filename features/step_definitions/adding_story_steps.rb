Given /^a project exists for person with id "([^"]*)" with title "([^"]*)" and description "([^"]*)"$/ do |arg1, arg2, arg3|
  Project.create!(:person_id => arg1, :title => arg2, :description => arg3)
end


Then /^(\d+) story should exist$/ do |arg1|
  Story.count.should == 1
end