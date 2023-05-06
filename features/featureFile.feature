Feature: Publicar una página borrador

@user2 @web
Scenario: Publicación de una existente página en estado "Borrador" y validación de disponibilidad en la aplicación.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I go to pages tab
  When I create a new page with title "$string_1" and content "$string_2"
  And I wait for 1 seconds
  And I go back to page list
  And I wait for 1 seconds
  Then I verified that the page with title "$$string_1" is on the page list
  And I verified that the page with title "$$string_1" has "Draft" status