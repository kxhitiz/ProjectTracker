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
    Then I sleep for "3" seconds
    And I press "Create Project"
    Then I should see "Project Added Successfully" message

  Scenario: Delete adding_project

