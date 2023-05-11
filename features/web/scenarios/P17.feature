Feature: Cambiar rol de un usuario

@user1 @web
Scenario: Cambiar rol de usuario de Author a Contributor.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I take screenshot with name "P17.1 Login v3.41.1"
  And I wait for 2 seconds
  And I go to staff tab
  And I take screenshot with name "P17.2 Staff v3.41.1"
  When I select the Ghost user
  And I take screenshot with name "P17.3 User v3.41.1"
  And I change role to Contributor
  And I take screenshot with name "P17.4 User role change v3.41.1"
  And I save the user
  And I take screenshot with name "P17.5 User saved v3.41.1"
  Then I go back to staff list
  And I wait for 1 seconds
  And I take screenshot with name "P17.6 Staff list v3.41.1"
  And I verify that the role tag is Contributor
  And I take screenshot with name "P17.7 Contributor role v3.41.1"