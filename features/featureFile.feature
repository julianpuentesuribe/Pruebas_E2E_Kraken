Feature: Publicar una página borrador

@user2 @web
Scenario: Publicación de una existente página en estado "Borrador" y validación de disponibilidad en la aplicación.
  Given I navigate to page "<URL>"
  And I take screenshot with name "P07.1 Carga la pantalla de Login v4.44.0"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I take screenshot with name "P07.2 Login v4.44.0"
  And I wait for 2 seconds
  And I go to pages tab
  And I take screenshot with name "P07.3 Ir a la pestaña Pages v4.44.0"
  When I create a new page with title "$string_1" and content "$string_2"
  And I wait for 1 seconds
  And I take screenshot with name "P07.4 Crear página v4.44.0"
  And I go back to page list
  And I wait for 1 seconds
  And I take screenshot with name "P07.5 Ir a la lista de páginas v4.44.0"
  Then I verify that the page with title "$$string_1" is on the page list
  And I take screenshot with name "P07.6 Verificar que este la página creada en la lista v4.44.0"
  And I verify that the page with title "$$string_1" has "Draft" status
  And I take screenshot with name "P07.7 Verificar que este la página tenga estatus 'Draft' v4.44.0"