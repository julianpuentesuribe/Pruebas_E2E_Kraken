Feature: Eliminar link de navegación

@user2 @web
Scenario: Eliminar un link y verificar el cambio.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I go to design tab
  And I add a new link with label "$string_1" and url "$url_1"
  And I save the design
  And I wait for 1 seconds
  Then I reload
  When I delete created link
  And I wait for 2 seconds
  And I save the design
  Then I reload
  And I verify deleted link with label "$$string_1" and url "$$url_1" is not there
