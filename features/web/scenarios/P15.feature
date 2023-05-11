Feature: Cambiar la estado de un usuario a inactivo.

@user1 @web
Scenario: Cambiar la estado de un usuario a inactivo.
  Given I navigate to page "<URL>"
  And I wait for 2 seconds
  And I take screenshot with name "15.1 carga pagina"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "15.2 Autenticación"
  And I go to staff tab
  And I wait for 2 seconds
  And I take screenshot with name "15.3 click  staff"
  And I select the Ghost user
  And I wait for 2 seconds
  And I take screenshot with name "15.4 Ghost user"
  And I change password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "15.5 cambiar pass Ghost user"
  When I change state
  And I wait for 2 seconds
  And I take screenshot with name "15.6 cambiar estado Ghost user"
  Then I sign out "<URL>" 
  And I wait for 2 seconds
  And I take screenshot with name "15.7 cerrar sesion"
  And I login with username "<USERNAMEGHOST>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "15.8 autentica Ghost user"