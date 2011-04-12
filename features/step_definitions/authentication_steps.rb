Given /^I am authenticated$/ do
  Person.create!(:name => "prashidha", :email => "p@email.com", :password => "password")
  visit('/people/sign_in')
  fill_in "Email", :with => 'p@email.com'
  fill_in "Password", :with => 'password'
  click_button "Sign in"
end