Feature: Publicar un post borrador

@user2 @web
Scenario: Publicación de un existente post en estado "Borrador" y validación de disponibilidad en la aplicación.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P02.1 Login v4.44.0"
  And I go to posts tab
  And I take screenshot with name "P02.2 Go to Posts v4.44.0"
  When I create a new post with title "$string_1" and content "$string_2"
  And I wait for 1 seconds
  And I take screenshot with name "P02.3 Create Post v4.44.0"
  And I go back to post list
  And I wait for 1 seconds
  And I take screenshot with name "P02.4 Go back to Posts v4.44.0"
  Then I verify that the post with title "$$string_1" is on the post list
  And I verify that the post with title "$$string_1" has "Draft" status