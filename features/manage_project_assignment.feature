@javascript
Feature: Manage project assignment

Background:
  Given I am authenticated as "Duke"
  Given I am on the new adding_project page
  And when I fill in "Title" with "SproutTube"
  And when I fill in "Description" with "Online Video Streaming Site"
  And I press "Create Project"
  And I follow "SproutTube"


Scenario: Login and assign user to the project
    And I select "shyam" from "people"
    And I press "Add Now"
    Then I should see "shyam is now added to SproutTube"
    And I follow "Add new Story"
    And I fill in "Title" with "Brand New Story"
    And I fill in "Description" with "Old Days stories"
    And I fill in "Weight" with "5"
    And I press "Create Story"
    Then 1 story should exist
    Then I should see "Story Created Successfully"
    And I follow "Brand New Story"
    And I select "shyam" from "people"
    And I press "Assign"
    And I follow "Message(1 new)"
    Then I should see "You have assigned Brand New Story of project SproutTube to shyam less than a minute ago! "
    And I follow "LogOut"
    And I sign in as "shyam"
    Then I should see "SproutTube"
    And I follow "Message(1 new)"
    Then I should see "Hello, you have been assigned to Brand New Story of project SproutTube by Duke less than a minute ago! "



