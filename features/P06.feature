Feature: Publicar una página nueva

@user1 @web
Scenario: Publicación de una página nueva y validación de disponibilidad en la aplicación.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I go to pages tab
  When I create a new page with title "$string_1" and content "$string_2"
  And I publish the current page
  And I wait for 2 seconds
  Then I verified that the page with title "$$string_1" is in the page list
  Then I verified that the page with title "$$string_1" is available in the webpage