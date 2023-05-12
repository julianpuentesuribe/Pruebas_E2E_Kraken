Feature: Creación de un tag y validación de la creación del tag.

@user2 @web
Scenario: Creación de un tag y validación de la creación del tag.
  Given I navigate to page "<URL>"
  And I take screenshot with name "P11.1 carga pagina v4.44.0"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I take screenshot with name "P11.2 Login v4.44.0"
  And I wait for 2 seconds
  And I take screenshot with name "P11.3 Ingreso Ghost v4.44.0"
  And I go to tags tab    
  And I wait for 2 seconds
  And I take screenshot with name "P11.4 click tag v4.44.0"
  When I create a new tag with name "$string_1", slug "$$string_1" and description "$string_2"
  And I take screenshot with name "P11.5 Informacion tag v4.44.0"
  And I save tha tag
  And I wait for 2 seconds
  And I take screenshot with name "P11.6 Guardar tag v4.44.0"
  Then I go to tags tab
  And I wait for 2 seconds
  And I take screenshot with name "P11.7 click tag v4.44.0"
  And I select a tag in the list with name "$$string_1" 
  And I wait for 2 seconds
  And I take screenshot with name "P11.8 Validar tag v4.44.0"