Feature: Eliminar una página

@user2 @web
Scenario: Eliminación de una página existente y validación de la no disponibilidad de la página en la aplicación.
  Given I navigate to page "<URL>"
  And I take screenshot with name "P10.1 Carga la pantalla de Login v4.44.0"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I take screenshot with name "P10.2 Login v4.44.0"
  And I wait for 2 seconds
  And I go to pages tab
  And I take screenshot with name "P10.3 Ir a la pestaña Pages v4.44.0"
  And I create a new page with title "$string_1" and content "$string_2"
  And I take screenshot with name "P10.4 Crear página v4.44.0"
  And I publish the current page
  And I wait for 1 seconds
  And I take screenshot with name "P10.5 Publicar página v4.44.0"
  And I go back to page list
  And I take screenshot with name "P10.6 Ir a la lista de páginas v4.44.0"
  When I select a page in the list with title "$$string_1" 
  And I wait for 2 seconds
  And I take screenshot with name "P10.7 Seleccionar la página v4.44.0"
  And I delete the page
  And I take screenshot with name "P10.8 Eliminar la página v4.44.0"
  And I wait for 2 seconds
  And I verify page with title "$$string_1" is not on the page list
  And I take screenshot with name "P10.9 Página no está en lista v4.44.0"
  And I verify that the page is not available in the webpage
  And I take screenshot with name "P10.10 Página no está disponible en el sitio v4.44.0"