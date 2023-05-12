Feature: Editar link de navegación

@user2 @web
Scenario: Editar únicamente el label de un link y verificar el cambio
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I take screenshot with name "P19.1 Login v3.41.1"
  And I wait for 2 seconds
  And I go to design tab
  And I take screenshot with name "P19.2 Design v3.41.1"
  When I edit first label with value "$string_1"
  And I take screenshot with name "P19.3 Edit v3.41.1"
  And I save the design
  And I take screenshot with name "P19.4 Save v3.41.1"
  And I wait for 2 seconds
  Then I reload
  And I take screenshot with name "P19.5 Reload v3.41.1"
  And I verify first label has value "$$string_1"
  And I take screenshot with name "P19.6 Verify v3.41.1"
