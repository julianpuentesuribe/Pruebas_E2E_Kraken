Feature: Cambiar la estado de un usuario a inactivo.

@user1 @web
Scenario: Cambiar la estado de un usuario a inactivo.
  Given I navigate to page "<URL>"
  And I wait for 2 seconds
  And I take screenshot with name "P15.1 carga pagina v3.41.1"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P15.2 Autenticación v3.41.1"
  And I go to staff tab
  And I wait for 2 seconds
  And I take screenshot with name "P15.3 click  staff v3.41.1"
  And I select the Ghost user
  And I wait for 2 seconds
  And I take screenshot with name "P15.4 Ghost user v3.41.1"
  And I change password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P15.5 cambiar pass Ghost user v3.41.1"
  When I change state
  And I wait for 2 seconds
  And I take screenshot with name "P15.6 cambiar estado Ghost user v3.41.1"
  Then I sign out "<URL>" 
  And I wait for 2 seconds
  And I take screenshot with name "P15.7 cerrar sesion v3.41.1"
  And I login with username "<USERNAMEGHOST>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P15.8 autentica Ghost user v3.41.1"