Feature: Eliminar link de navegación

@user2 @web
Scenario: Eliminar un link y verificar el cambio.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I go to design tab
  When I edit first label with value "$string_1"
  And I save the design
  And I wait for 2 seconds
  Then I reload
  And I verify first label has value "$$string_1"