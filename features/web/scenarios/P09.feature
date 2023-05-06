Feature: Editar una página

@user2 @web
Scenario: Edición unicamente del título de una página existente y validación de cambios en la aplicación.
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
  And I edit page title with "$string_3"
  And I wait for 2 seconds
  And I update page
  And I wait for 2 seconds
  Then I verify that the edited title "$$string_3" appeared on the website