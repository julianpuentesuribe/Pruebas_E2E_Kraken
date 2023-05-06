Feature: Eliminar una página

@user2 @web
Scenario: Eliminación de una página existente y validación de la no disponibilidad de la página en la aplicación.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I go to pages tab
  And I create a new page with title "$string_1" and content "$string_2"
  And I publish the current page
  And I wait for 1 seconds
  And I go back to page list
  When I select a page in the list with title "$$string_1" 
  And I wait for 2 seconds
  And I delete the page
  And I wait for 2 seconds
  And I verify page with title "$$string_1" is not on the page list
  And I verify that the page is not available in the webpage