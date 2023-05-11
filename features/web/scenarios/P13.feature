Feature: Eliminar un tag y validación de la eliminación del tag.

@user2 @web
Scenario: Eliminar un tag y validación de la eliminación del tag.
  Given I navigate to page "<URL>"
  And I take screenshot with name "13.1 carga pagina"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "13.2 Login"
  And I go to tags tab  
  And I wait for 2 seconds
  And I take screenshot with name "13.3 Click tag"
  And I create a new tag with name "$string_1", slug "$$string_1" and description "$string_2"
  And I wait for 2 seconds
  And I take screenshot with name "13.4 Información tag"
  And I save tha tag
  And I wait for 2 seconds
  And I take screenshot with name "13.5 Guardar tag"
  And I go to tags tab
  And I wait for 2 seconds
  And I take screenshot with name "13.6 Click tag"
  When I select a tag in the list with name "$$string_1" 
  And I wait for 2 seconds
  And I take screenshot with name "13.7 Selecionar tag"
  And I delete tag
  And I wait for 2 seconds
  And I take screenshot with name "13.8 Borrar tag"
  Then I verify tag with title "$$string_1" is not on the tag list
  And I wait for 2 seconds
  And I take screenshot with name "13.9 Ingresar tag eliminado"