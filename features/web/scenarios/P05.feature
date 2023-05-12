Feature: Eliminar un post

@user2 @web
Scenario: Eliminación de un post existente y validación de la no disponibilidad de la post en la aplicación.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P05.1 Login v4.44.0"
  And I go to posts tab
  And I take screenshot with name "P05.2 Go to posts v4.44.0"
  And I create a new post with title "$string_1" and content "$string_2"
  And I take screenshot with name "P05.3 Create Post v4.44.0"
  And I publish the current post
  And I wait for 1 seconds
  And I take screenshot with name "P05.4 Publish post v4.44.0"
  And I go back to post list
  And I take screenshot with name "P05.5 Go back to posts v4.44.0"
  When I select a post in the list with title "$$string_1" 
  And I wait for 2 seconds
  And I take screenshot with name "P05.6 Click post v4.44.0"
  And I delete the post
  And I wait for 2 seconds
  And I take screenshot with name "P05.7 Delete Post v4.44.0"
  And I verify post with title "$$string_1" is not on the post list
  And I verify that the page is not available in the webpage