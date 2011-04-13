Feature: Manage adding_projects
In order to create project
[stakeholder]
wants [behaviour]


@javascript
  Scenario: Register new project
    Given I am authenticated
    Given I am on the new adding_project page
    And when I fill in "Title" with "SproutTube"
    And when I fill in "Description" with "Online Video Streaming Site"
    And I press "Create Project"
    Then 1 project should exist
    Then I should see "Project Added Successfully" message

@javascript
  Scenario: Edit the project
    Given I am authenticated
    Given a project exists with title "Sprout Note" and description "This is for sprouters"
    Then 1 project should exist
    Given I am on the projects page
    And I follow "Edit"
    And when I fill in "Title" with "Online SproutTube"
    And I press "Update Project"
    Then the project should have title "Online SproutTube" and description "This is for sprouters"
    Then I should see "Project Updated Successfully"

@javascript
  Scenario: Destroy the project
   Given I am authenticated
   Given a project exists with title "Sprout Note" and description "This is for sprouters"
   Then 1 project should exist
   Given I am on the projects page
   And I disable confirm dialog box
   And I follow "Delete"
   And I sleep for "2" seconds
   Then I should see "Project Deleted Successfully"

@javascript
  Scenario: Add story to the project
   Given I am authenticated
   Given I am on the new adding_project page
   And when I fill in "Title" with "SproutTube"
   And when I fill in "Description" with "Online Video Streaming Site"
   And I press "Create Project"
   Then 1 project should exist
   Then I should see "Project Added Successfully" message
   And I follow "SproutTube"
   And I follow "+Add Story"
   And I fill in "Title" with "Story1"
   And I fill in "Weight" with "2"
   And I press "Create Story"
   Then I should see "Story Created Successfully"
   Then 1 story should exist




