Feature: Editar un post

@user2 @web
Scenario: Edición unicamente del cuerpo de un post existente y validación de cambios en la aplicación.
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
  And I edit post content with "$string_3"
  And I wait for 2 seconds
  And I update post
  And I wait for 2 seconds
  Then I verify that the edited content "$string_2""$$string_3" appeared on the website