Feature: Publicar una página nueva

@user1 @web
Scenario: Publicación de una página nueva y validación de disponibilidad en la aplicación.
  Given I navigate to page "<URL>"
  And I take screenshot with name "P06.1 Carga la pantalla de Login v4.44.0"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I take screenshot with name "P06.2 Login v4.44.0"
  And I wait for 2 seconds
  And I go to pages tab
  And I take screenshot with name "P06.3 Ir a la pestaña Pages v4.44.0"
  When I create a new page with title "$string_1" and content "$string_2"
  And I take screenshot with name "P06.4 Crear página v4.44.0"
  And I publish the current page
  And I wait for 1 seconds
  And I take screenshot with name "P06.5 Publicar página v4.44.0"
  Then I go back to page list
  And I wait for 1 seconds
  And I take screenshot with name "P06.6 Ir a la lista de páginas v4.44.0"
  And I verify that the page with title "$$string_1" is on the page list
  And I take screenshot with name "P06.7 Verificar que este la página creada en la lista v4.44.0"
  And I verify that the page with title "$$string_1" is available in the webpage
  And I take screenshot with name "P06.8 Página visible en sitio v4.44.0"