Feature: Eliminar un post

@user2 @web
Scenario: Eliminación de un post existente y validación de la no disponibilidad de la post en la aplicación.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I go to posts tab
  And I create a new post with title "$string_1" and content "$string_2"
  And I publish the current post
  And I wait for 1 seconds
  And I go back to post list
  When I select a post in the list with title "$$string_1" 
  And I wait for 2 seconds
  And I delete the post
  And I wait for 2 seconds
  And I verify post with title "$$string_1" is not on the post list
  And I verify that the page is not available in the webpage