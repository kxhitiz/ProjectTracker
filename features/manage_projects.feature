Feature: Manage projects


Background:
  Given I am authenticated
  Given I am on the new adding_project page
  And when I fill in "Title" with "SproutTube"
  And when I fill in "Description" with "Online Video Streaming Site"
  And I press "Create Project"
  Then 1 project should exist
  Then I should see "Project Added Successfully" message

@javascript
  Scenario: Edit the project
    Given I am on the projects page
    And I follow "Click to Edit"
    And when I fill in "Title" with "Online SproutTube"
    And I press "Update Project"
    Then the project should have title "Online SproutTube" and description "This is for sprouters"
    Then I should see "Project Updated Successfully"


  Scenario: Destroy the project
   Given I am on the projects page
   And I disable confirm dialog box
   And I follow "Delete"
   Then I should see "Project Deleted Successfully"


  Scenario: Add story to the project
   And I follow "SproutTube"
   And I follow "+Add Story"
   And I fill in "Title" with "Story1"
   And I fill in "Weight" with "2"
   And I press "Create Story"
   Then I should see "Story Created Successfully"
   Then 1 story should exist


  Scenario: Assign a person to the project
    And I follow "SproutTube"
    And I select "Ram" from "people"
    And I press "Add Now"
    Then I should see "Ram is now added to SproutTube"


@javascript
  Scenario: Remove a person from the project

     And I follow "SproutTube"

             And I follow "Remove"
             Then I should see "Prashiddha is now removed from SproutTube"





















