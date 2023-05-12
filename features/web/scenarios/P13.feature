Feature: Eliminar un tag y validación de la eliminación del tag.

@user2 @web
Scenario: Eliminar un tag y validación de la eliminación del tag.
  Given I navigate to page "<URL>"
  And I take screenshot with name "P13.1 carga pagina v4.44.0"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P13.2 Login v4.44.0"
  And I go to tags tab  
  And I wait for 2 seconds
  And I take screenshot with name "P13.3 Click tag v4.44.0"
  And I create a new tag with name "$string_1", slug "$$string_1" and description "$string_2"
  And I wait for 2 seconds
  And I take screenshot with name "P13.4 Información tag v4.44.0"
  And I save tha tag
  And I wait for 2 seconds
  And I take screenshot with name "P13.5 Guardar tag v4.44.0"
  And I go to tags tab
  And I wait for 2 seconds
  And I take screenshot with name "P13.6 Click tag v4.44.0"
  When I select a tag in the list with name "$$string_1" 
  And I wait for 2 seconds
  And I take screenshot with name "P13.7 Selecionar tag v4.44.0"
  And I delete tag
  And I wait for 2 seconds
  And I take screenshot with name "P13.8 Borrar tag v4.44.0"
  Then I verify tag with title "$$string_1" is not on the tag list
  And I wait for 2 seconds
  And I take screenshot with name "P13.9 Ingresar tag eliminado v4.44.0"