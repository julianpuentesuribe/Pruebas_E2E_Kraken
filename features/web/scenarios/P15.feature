Feature: Cambiar la estado de un usuario a inactivo.

@user1 @web
Scenario: Cambiar la estado de un usuario a inactivo.
  Given I navigate to page "<URL>"
  And I wait for 2 seconds
  And I take screenshot with name "P15.1 carga pagina v4.44.0"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P15.2 Autenticación v4.44.0"
  And I go to staff tab
  And I wait for 2 seconds
  And I take screenshot with name "P15.3 click  staff v4.44.0"
  And I select the Ghost user
  And I wait for 2 seconds
  And I take screenshot with name "P15.4 Ghost user v4.44.0"
  And I change password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P15.5 cambiar pass Ghost user v4.44.0"
  When I change state
  And I wait for 2 seconds
  And I take screenshot with name "P15.6 cambiar estado Ghost user v4.44.0"
  Then I sign out "<URL>" 
  And I wait for 2 seconds
  And I take screenshot with name "P15.7 cerrar sesion v4.44.0"
  And I login with username "<USERNAMEGHOST>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P15.8 autentica Ghost user v4.44.0"