Feature: Cambiar la estado de un usuario a activo.

@user1 @web
Scenario: Cambiar la estado de un usuario a activo.
  Given I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P16.1 Login v3.41.1"
  And I go to staff tab
  And I take screenshot with name "P16.2 Staff-tab v3.41.1"
  And I select the Ghost user
  And I wait for 2 seconds
  And I take screenshot with name "P16.3 Ghost-user v3.41.1"
  Then I change active state
  Then I change active state
  And I take screenshot with name "P16.4 Change-active-state v3.41.1"
  And I change password "<PASSWORD>"
  And I wait for 2 seconds
  And I change state
  And I take screenshot with name "P16.5 Change-state v3.41.1"
  And I wait for 2 seconds
  And I sign out "<URL>"
  And I take screenshot with name "P16.6 Sign-out v3.41.1"
  And I wait for 2 seconds
  And I login with username "<USERNAMEGHOST>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P16.7 Login v3.41.1"
  When I navigate to page "<URL>"
  And I login with username "<USERNAME>" and password "<PASSWORD>"
  And I take screenshot with name "P16.8 Login v3.41.1"
  And I wait for 2 seconds
  And I go to staff tab
  And I take screenshot with name "P16.9 Staff-tab v3.41.1"
  And I select the Ghost user
  And I wait for 2 seconds
  Then I change idle state
  And I take screenshot with name "P16.10 Change-idle-state v3.41.1"
  And I wait for 2 seconds
  And I change idle state final
  And I wait for 12 seconds
  And I take screenshot with name "P16.11 Change-idle-state-final v3.41.1"
  And I sign out "<URL>" 
  And I wait for 2 seconds
  And I login with username "<USERNAMEGHOST>" and password "<PASSWORD>"
  And I wait for 2 seconds
  And I take screenshot with name "P16.12 Login v3.41.1"
