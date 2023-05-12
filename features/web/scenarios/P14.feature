Feature: Cambiar la contrasenia de un usuario.

@user1 @web
Scenario: Cambiar la contrasenia de un usuario.
  Given I navigate to page "<URL>"
  And I wait for 2 seconds
  And I take screenshot with name "P14.1 carga pagina v3.41.1"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P14.2 Autenticación v3.41.1"
  And I go to staff tab
  And I wait for 2 seconds
  And I take screenshot with name "P14.3 Click staff v3.41.1"
  When I select the Ghost user
  And I wait for 2 seconds
  And I take screenshot with name "P14.4 Click usuario ghost v3.41.1"
  And I change password "<PASSWORD>"
  And I wait for 2 seconds  
  And I take screenshot with name "P14.5 Cambio pass usuario ghost v3.41.1"
  Then I sign out "<URL>" 
  And I wait for 2 seconds
  And I take screenshot with name "P14.6 cerrar sesion v3.41.1"
  And I login with username "<USERNAMEGHOST>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P14.7 Iniciar sesion v3.41.1"