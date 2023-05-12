Feature: Editar un post

@user2 @web
Scenario: Edición unicamente del título de un post existente y validación de cambios en la aplicación.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P04.1 Login v4.44.0"
  And I go to posts tab
  And I take screenshot with name "P04.2 Go to post v4.44.0"
  And I create a new post with title "$string_1" and content "$string_2"
  And I take screenshot with name "P04.3 Create Post v4.44.0"
  And I publish the current post
  And I wait for 1 seconds
  And I take screenshot with name "P04.4 Publish Post v4.44.0"
  And I go back to post list
  And I take screenshot with name "P04.5 Go back to post v4.44.0"
  When I select a post in the list with title "$$string_1" 
  And I wait for 2 seconds
  And I take screenshot with name "P04.6 Click post v4.44.0"
  And I edit post title with "$string_3"
  And I wait for 2 seconds
  And I take screenshot with name "P04.7 Edit post title v4.44.0"
  And I update post
  And I wait for 2 seconds
  And I take screenshot with name "P04.8 Update post v4.44.0"
  Then I verify that the edited title "$$string_3" appeared on the website