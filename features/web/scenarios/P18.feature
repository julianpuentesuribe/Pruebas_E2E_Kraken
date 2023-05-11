Feature: Agregar link de navegación	

@user2 @web
Scenario: Agregar un nuevo link y verificar cambios.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I take screenshot with name "P18.1 Login v.3.41.1"
  And I wait for 2 seconds
  And I go to design tab
  And I wait for 1 seconds
  And I take screenshot with name "P18.2 Design tab v.3.41.1"
  When I add a new link with label "$string_1" and url "$url_1"
  And I take screenshot with name "P18.3 New link v.3.41.1"
  And I save the design
  And I take screenshot with name "P18.4 Save new link v.3.41.1"
  And I wait for 1 seconds
  Then I reload
  And I take screenshot with name "P18.5 Reload v.3.41.1"
  And I wait for 1 seconds
  And I verify new link with label "$$string_1" and url "$$url_1"
  And I take screenshot with name "P18.6 Verify new link v.3.41.1"
