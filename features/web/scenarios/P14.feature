Feature: Cambiar la contrasenia de un usuario.

@user1 @web
Scenario: Cambiar la contrasenia de un usuario.
  Given I navigate to page "<URL>"
  And I wait for 2 seconds
  And I take screenshot with name "14.1 carga pagina"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "14.2 Autenticación"
  And I go to staff tab
  And I wait for 2 seconds
  And I take screenshot with name "14.3 Click staff"
  When I select the Ghost user
  And I wait for 2 seconds
  And I take screenshot with name "14.4 Click usuario ghost"
  And I change password "<PASSWORD>"
  And I wait for 2 seconds  
  And I take screenshot with name "14.5 Cambio pass usuario ghost"
  Then I sign out "<URL>" 
  And I wait for 2 seconds
  And I take screenshot with name "14.6 cerrar sesion"
  And I login with username "<USERNAMEGHOST>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "14.7 Iniciar sesion"