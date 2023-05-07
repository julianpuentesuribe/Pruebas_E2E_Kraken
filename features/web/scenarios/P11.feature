Feature: Creación de un tag y validación de la creación del tag.

@user2 @web
Scenario: Creación de un tag y validación de la creación del tag.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I go to tags tab  
  And I wait for 2 seconds
  When I create a new tag with name "$string_1", slug "$$string_1" and description "$string_2"
  And I save tha tag
  And I wait for 2 seconds
  Then I go to tags tab
  And I wait for 2 seconds
  And I select a tag in the list with name "$$string_1" 
  And I wait for 2 seconds