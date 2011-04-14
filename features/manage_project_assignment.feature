@javascript
Feature: Manage project assignment


Scenario: Login and assign user to the project
    Given I am authenticated as "Duke"
    Given I am on the new adding_project page
    And when I fill in "Title" with "SproutTube"
    And when I fill in "Description" with "Online Video Streaming Site"
    And I press "Create Project"
    And I follow "SproutTube"
    And I select "shyam" from "people"
    And I press "Add Now"
    Then I should see "shyam is now added to SproutTube"
    And I follow "LogOut"
    And I sign in as "shyam"
    Then I should see "SproutTube"
    And I follow "SproutTube"
    Then I should see "Duke"
    Then I should see "shyam"




