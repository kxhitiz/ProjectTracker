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

Then /^I should see "([^"]*)" message$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end