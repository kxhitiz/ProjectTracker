Given /^the following adding_projects:$/ do |adding_projects|
  AddingProject.create!(adding_projects.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) adding_project$/ do |pos|
  visit adding_projects_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following adding_projects:$/ do |expected_adding_projects_table|
  expected_adding_projects_table.diff!(tableish('table tr', 'td,th'))
end


Given /^when I fill in "([^"]*)" with "([^"]*)"$/ do |arg1, arg2|
  fill_in arg1, :with => arg2
end

Then /^I sleep for "([^"]*)" seconds$/ do |arg1|
  sleep(arg1.to_i)
end

Then /^(\d+) project should exist$/ do |arg1|
  Project.count.should == 1
end

Given /^a project exists with title "([^"]*)" and description "([^"]*)"$/ do |title, description|
  @project = Project.create!(:title => title , :description => description)
  Connection.create!(:project_id => Project.first.id, :person_id => Person.first.id, :types => "owner")
  @project.person_id = Person.first.id
end

Then /^the project should have title "([^"]*)" and description "([^"]*)"$/ do |arg1, arg2|
 Project.create!(:title => arg1 , :description => arg2)
end

Given /^I am "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end



Then /^I should see "([^"]*)" message$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end