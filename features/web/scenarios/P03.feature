Feature: Editar un post

@user2 @web
Scenario: Edición unicamente del cuerpo de un post existente y validación de cambios en la aplicación.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P03.1 Login v4.44.0"
  And I go to posts tab
  And I take screenshot with name "P03.2 Go to Posts v4.44.0"
  And I create a new post with title "$string_1" and content "$string_2"
  And I take screenshot with name "P03.3 Create Post v4.44.0"
  And I publish the current post
  And I wait for 1 seconds
  And I take screenshot with name "P03.4 Publish Post v4.44.0"
  And I go back to post list
  And I take screenshot with name "P03.5 Go back to posts v4.44.0"
  When I select a post in the list with title "$$string_1" 
  And I wait for 2 seconds
  And I take screenshot with name "P03.6 Click post v4.44.0"
  And I edit post content with "$string_3"
  And I wait for 2 seconds
  And I take screenshot with name "P03.7 Edit content v4.44.0"
  And I update post
  And I wait for 2 seconds
  And I take screenshot with name "P03.8 Update post v4.44.0"
  Then I verify that the edited content "$string_2""$$string_3" appeared on the website