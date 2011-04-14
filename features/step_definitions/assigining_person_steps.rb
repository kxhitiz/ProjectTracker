Then /^I have signed up as "([^"]*)"$/ do |arg1|
 Person.create!(:name => arg1, :email => "asd@email.com", :password => "1password")

end

Then /^I select "([^"]*)"from "([^"]*)"$/ do |arg1, arg2|
  select(arg1, :from => arg2)
end