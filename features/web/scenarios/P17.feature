Feature: Cambiar rol de un usuario

@user1 @web
Scenario: Cambiar rol de usuario de Author a Contributor.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I go to staff tab
  When I select the Ghost user
  And I change role to Contributor
  And I save the user
  Then I go back to staff list
  And I wait for 1 seconds
  And I verify that the role tag is Contributor