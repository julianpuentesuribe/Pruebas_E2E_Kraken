Feature: Agregar link de navegación	

@user2 @web
Scenario: Agregar un nuevo link y verificar cambios.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I go to design tab
  And I wait for 1 seconds
  When I add a new link with label "$string_1" and url "$url_1"
  And I save the design
  And I wait for 1 seconds
  Then I reload
  And I wait for 1 seconds
  And I verify new link with label "$string_1" and url "$url_1"
