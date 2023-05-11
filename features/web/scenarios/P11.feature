Feature: Creación de un tag y validación de la creación del tag.

@user2 @web
Scenario: Creación de un tag y validación de la creación del tag.
  Given I navigate to page "<URL>"
  And I take screenshot with name "11.1 carga pagina"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I take screenshot with name "11.2 Login"
  And I wait for 2 seconds
  And I take screenshot with name "11.3 Ingreso Ghost"
  And I go to tags tab    
  And I wait for 2 seconds
  And I take screenshot with name "11.4 click tag"
  When I create a new tag with name "$string_1", slug "$$string_1" and description "$string_2"
  And I take screenshot with name "11.5 Informacion tag"
  And I save tha tag
  And I wait for 2 seconds
  And I take screenshot with name "11.6 Guardar tag"
  Then I go to tags tab
  And I wait for 2 seconds
  And I take screenshot with name "11.7 click tag"
  And I select a tag in the list with name "$$string_1" 
  And I wait for 2 seconds
  And I take screenshot with name "11.8 Validar tag"