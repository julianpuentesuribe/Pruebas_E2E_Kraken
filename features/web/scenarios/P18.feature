Feature: Agregar link de navegación

@user1 @web
Scenario: Agregar un nuevo link con el Label AnotherHome.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I go to design tab
  When I create a new navigation item with the label "$string_1" and url "$url_1"
  And I save the design
  Then I go to view the site
  And I wait for 1 seconds
  And I verify that a navigation with the label "$$string_1" and url "$$url_1" exists