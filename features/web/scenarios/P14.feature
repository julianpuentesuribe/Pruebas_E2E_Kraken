Feature: Cambiar la contrasenia de un usuario.

@user1 @web
Scenario: Cambiar la contrasenia de un usuario.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I go to staff tab
  When I select the Ghost user
  And I wait for 2 seconds
  And I change password "<PASSWORD>"
  And I wait for 2 seconds  
  Then I sign out "<URL>" 
  And I wait for 2 seconds
  And I login with username "<USERNAMEGHOST>" and password "<PASSWORD>"
  And I wait for 2 seconds