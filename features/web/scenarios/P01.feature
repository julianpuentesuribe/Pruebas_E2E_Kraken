Feature: Publicar un post nueva

@user1 @web
Scenario: Publicación de un post nuevo y validación de disponibilidad en la aplicación.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P01.1 Login v4.44.0"
  And I go to posts tab
  And I take screenshot with name "P01.2 Click Posts v4.44.0"
  When I create a new post with title "$string_1" and content "$string_2"
  And I take screenshot with name "P01.3 Create Post v4.44.0"
  And I publish the current post
  And I wait for 1 seconds
  And I take screenshot with name "P01.4 Publish Post v4.44.0"
  Then I go back to post list
  And I wait for 1 seconds
  And I take screenshot with name "P01.5 Back to Posts v4.44.0"
  And I verify that the post with title "$$string_1" is on the post list
  And I verify that the post with title "$$string_1" is available in the webpage