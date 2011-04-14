Given /^I am authenticated as "([^"]*)"$/ do |arg1|
  Person.create!(:name => arg1, :email => "duke@email.com", :password => "password")
  Person.create!(:name => "shyam", :email => "shyam@email.com", :password => "password2")
  visit('/people/sign_in')
  fill_in "Email", :with => 'duke@email.com'
  fill_in "Password", :with => 'password'
  click_button "Sign in"
end


Then /^I sign in as "([^"]*)"$/ do |arg1|
  visit('/people/sign_in')
  fill_in "Email", :with => 'shyam@email.com'
  fill_in "Password", :with => 'password2'
  click_button "Sign in"
end