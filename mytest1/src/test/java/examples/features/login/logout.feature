@logout
Feature: tst for login and user creation

Scenario: login with static param, navigate and create a new user

  Given configure driver =
  """
  {
    type: 'chrome',
    webDriverSession: { 
      capabilities: { 
        acceptInsecureCerts: true,
        browserName: 'chrome'
      } 
    },
    addOptions: [
      '--start-maximized',
      '--ignore-certificate-errors',
      '--ignore-ssl-errors',
      '--test-type'
    ]
  }
  """

  And driver 'https://192.168.140.168' 

  And retry(10, 1000).waitFor('#mat-input-1')
  And input('#mat-input-1', 'superuser')
  And input('#mat-input-2', 'admin12345@')
  And input('#mat-input-3', '555555')

  And click('.submit.mat-raised-button.mat-primary')

  And driver 'https://192.168.140.168/bts-status/site-runtime-view'
  And waitForUrl('/bts-status/site-runtime-view')
  And match driver.title == 'eNB Web Management' 
  And delay(5000)

  And click("//mat-icon[text()='person']")
    * def logoutButton = "//button[contains(., 'Logout')]"
      And waitFor(logoutButton).click()
      And delay(5000)
      And retry(10, 1000).waitFor('#mat-input-1')
    And input('#mat-input-1', 'superuser')
    And input('#mat-input-2', 'admin12345@')
    And input('#mat-input-3', '555555')
    And click('.submit.mat-raised-button.mat-primary')

    And driver 'https://192.168.140.168/bts-status/site-runtime-view'
    And waitForUrl('/bts-status/site-runtime-view')
    And match driver.title == 'eNB Web Management' 
     And delay(5000)