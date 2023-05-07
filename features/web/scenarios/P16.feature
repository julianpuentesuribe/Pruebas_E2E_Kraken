Feature: Cambiar la estado de un usuario a inactivo.

@user1 @web
Scenario: Cambiar la estado de un usuario a inactivo.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I go to staff tab
  And I select the Ghost user
  And I wait for 2 seconds
  And I change password "<PASSWORD>"
  And I wait for 2 seconds
  And I change state
  And I wait for 2 seconds
  And I sign out "<URL>" 
  And I wait for 2 seconds
  And I login with username "<USERNAMEGHOST>" and password "<PASSWORD>"
  And I wait for 2 seconds
  When I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I go to staff tab
  And I select the Ghost user
  And I wait for 2 seconds
  Then I change idle state
  And I wait for 2 seconds
  And I sign out "<URL>" 
  And I wait for 2 seconds
  And I login with username "<USERNAMEGHOST>" and password "<PASSWORD>"
  And I wait for 2 seconds