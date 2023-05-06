Feature: Publicar un post nueva

@user1 @web
Scenario: Publicación de un post nuevo y validación de disponibilidad en la aplicación.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I go to posts tab
  When I create a new post with title "$string_1" and content "$string_2"
  And I publish the current post
  And I wait for 1 seconds
  Then I go back to post list
  And I wait for 1 seconds
  And I verified that the post with title "$$string_1" is on the post list
  And I verified that the post with title "$$string_1" is available in the webpage