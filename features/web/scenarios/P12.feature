Feature: Edición de titulo en tag y validación de la Edición del tag.

@user2 @web
Scenario: Edición de titulo en tag y validación de la Edición del tag.
  Given I navigate to page "<URL>"
  And I take screenshot with name "12.1 carga pagina"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I take screenshot with name "12.2 Autenticación"
  And I wait for 2 seconds
  And I take screenshot with name "12.3 Ingreso a Ghost"
  And I go to tags tab  
  And I wait for 2 seconds
  And I take screenshot with name "12.4 Click tag"
  And I create a new tag with name "$string_1", slug "$$string_1" and description "$string_2"
  And I wait for 2 seconds
  And I take screenshot with name "12.5 Información Tag"
  And I save tha tag
  And I wait for 2 seconds
  And I take screenshot with name "12.6 Guardar Tag"
  And I go to tags tab
  And I wait for 2 seconds
  And I take screenshot with name "12.7 click Tag"
  When I select a tag in the list with name "$$string_1" 
  And I wait for 2 seconds
  And I take screenshot with name "12.8 Seleccionar Tag"
  And I edit tag name "$string_3"
  And I wait for 2 seconds
  And I take screenshot with name "12.9 Editar titulo Tag"
  And I save tha tag
  And I wait for 2 seconds
  And I take screenshot with name "12.10 Actualizar titulo Tag"
  Then I go to tags tab
  And I wait for 2 seconds
  And I take screenshot with name "12.11 click Tag"
  And I select a tag in the list with name "$$string_3" 
  And I wait for 2 seconds
  And I take screenshot with name "12.12 Seleccionar actualizado Tag"