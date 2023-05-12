Feature: Editar una página

@user2 @web
Scenario: Edición unicamente del título de una página existente y validación de cambios en la aplicación.
  Given I navigate to page "<URL>"
  And I take screenshot with name "P09.1 Carga la pantalla de Login v4.44.0"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I take screenshot with name "P09.2 Login v4.44.0"
  And I wait for 2 seconds
  And I go to pages tab
  And I take screenshot with name "P09.3 Ir a la pestaña Pages v4.44.0"
  And I create a new page with title "$string_1" and content "$string_2"
  And I take screenshot with name "P09.4 Crear página v4.44.0"
  And I publish the current page
  And I wait for 1 seconds
  And I take screenshot with name "P09.5 Publicar página v4.44.0"
  And I go back to page list
  And I take screenshot with name "P09.6 Ir a la lista de páginas v4.44.0"
  When I select a page in the list with title "$$string_1" 
  And I wait for 2 seconds
  And I take screenshot with name "P09.7 Seleccionar la página v4.44.0"
  And I edit page title with "$string_3"
  And I take screenshot with name "P09.8 Editar título página v4.44.0"
  And I wait for 2 seconds
  And I update page
  And I take screenshot with name "P09.9 Actualizar página v4.44.0"
  And I wait for 2 seconds
  Then I verify that the edited title "$$string_3" appeared on the website
  And I take screenshot with name "P09.10 Edición visible en sitio v4.44.0"