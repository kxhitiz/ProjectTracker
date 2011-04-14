Given /^there is next user "([^"]*)"$/ do |arg1|
  Connection.create!(:person_id => Person.all.second, :project_id => Project.first)

end

Given /^there is another person assigned to this project$/ do
  Connection.create!(:person_id => Person.all.second, :project_id => Project.first)
  
end