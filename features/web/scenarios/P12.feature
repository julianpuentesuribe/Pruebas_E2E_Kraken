Feature: Edición de titulo en tag y validación de la Edición del tag.

@user2 @web
Scenario: Edición de titulo en tag y validación de la Edición del tag.
  Given I navigate to page "<URL>"
  And I take screenshot with name "P12.1 carga pagina v4.44.0"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I take screenshot with name "P12.2 Autenticación v4.44.0"
  And I wait for 2 seconds
  And I take screenshot with name "P12.3 Ingreso a Ghost v4.44.0"
  And I go to tags tab  
  And I wait for 2 seconds
  And I take screenshot with name "P12.4 Click tag v4.44.0"
  And I create a new tag with name "$string_1", slug "$$string_1" and description "$string_2"
  And I wait for 2 seconds
  And I take screenshot with name "P12.5 Información Tag v4.44.0"
  And I save tha tag
  And I wait for 2 seconds
  And I take screenshot with name "P12.6 Guardar Tag v4.44.0"
  And I go to tags tab
  And I wait for 2 seconds
  And I take screenshot with name "P12.7 click Tag v4.44.0"
  When I select a tag in the list with name "$$string_1" 
  And I wait for 2 seconds
  And I take screenshot with name "P12.8 Seleccionar Tag v4.44.0"
  And I edit tag name "$string_3"
  And I wait for 2 seconds
  And I take screenshot with name "P12.9 Editar titulo Tag v4.44.0"
  And I save tha tag
  And I wait for 2 seconds
  And I take screenshot with name "P12.10 Actualizar titulo Tag v4.44.0"
  Then I go to tags tab
  And I wait for 2 seconds
  And I take screenshot with name "P12.11 click Tag v4.44.0"
  And I select a tag in the list with name "$$string_3" 
  And I wait for 2 seconds
  And I take screenshot with name "P12.12 Seleccionar actualizado Tag v4.44.0"