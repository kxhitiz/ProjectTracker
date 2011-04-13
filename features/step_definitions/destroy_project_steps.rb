Given /^I disable confirm dialog box$/ do
 page.evaluate_script('window.confirm = function() { return true; }')
end