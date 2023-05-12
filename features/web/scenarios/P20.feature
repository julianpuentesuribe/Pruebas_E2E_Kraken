Feature: Eliminar link de navegación

@user2 @web
Scenario: Eliminar un link y verificar el cambio.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I take screenshot with name "P20.1 Login v3.41.1"
  And I wait for 2 seconds
  And I go to design tab
  And I take screenshot with name "P20.2 Design-tab v3.41.1"
  And I add a new link with label "$string_1" and url "$url_1"
  And I take screenshot with name "P20.3 Add-link v3.41.1"
  And I save the design
  And I take screenshot with name "P20.4 Save-design v3.41.1"
  And I wait for 1 seconds
  Then I reload
  And I take screenshot with name "P20.5 Reload v3.41.1"
  When I delete created link
  And I take screenshot with name "P20.6 Delete-link v3.41.1"
  And I wait for 2 seconds
  And I save the design
  And I take screenshot with name "P20.7 Save-design delele-link v3.41.1"
  Then I reload
  And I take screenshot with name "P20.8 Reload saved changes v3.41.1"
  And I verify link with label "$string_1" and url "$url_1" is not there
  And I take screenshot with name "P20.9 Verify-link-not-there v3.41.1"