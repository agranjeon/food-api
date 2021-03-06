Feature:
  In order to get the information about the calendar of a user
  As a user
  I want to get the preview of my calendar

  Scenario: A user ask for his calendar without begin logged in
    Given I am not logged in
    When I add "content-type" header equal to "application/json"
    And I send a GET request to "/api/profile/calendar/days/0"
    Then the response status code should be 401

  Scenario: A user ask for a specific day of his calendar with valid token
    Given there is a user with email "john@doe.com" and password "s3cr3t"
    And I am logged in with john@doe.com
    When I add "content-type" header equal to "application/json"
    And I send a GET request to "/api/profile/calendar/days/0"
    Then the response status code should be 200
    And the JSON node "root.position" should be equal to 0
    And the JSON node "root.meals" should have 2 elements

  Scenario: A user ask for a specific day outside of a the week
    Given there is a user with email "john@doe.com" and password "s3cr3t"
    And I am logged in with john@doe.com
    When I add "content-type" header equal to "application/json"
    And I send a GET request to "/api/profile/calendar/days/9"
    Then the response status code should be 404
