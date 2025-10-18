@changesui
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
  And input('#mat-input-2', 'admin123@')
  And input('#mat-input-3', '555555')

  And click('.submit.mat-raised-button.mat-primary')

  And driver 'https://192.168.140.168/bts-status/site-runtime-view'
  And waitForUrl('/bts-status/site-runtime-view')
  And match driver.title == 'eNB Web Management' 
  And delay(5000)

  And click("//mat-icon[text()='person']")
  And retry(10, 500).waitFor("//*[contains(., 'User Account Management')]")
  And mouse("//a[contains(., 'User Account Management')]").click()

  And waitForUrl('/user-management/users-management')
  And match driver.url == 'https://192.168.140.168/user-management/users-management'
  And delay(3000)
  And retry(10, 500).waitFor("//a[text()='Change Password']")
  And click("//a[text()='Change Password']")


  And waitForUrl('/user-management/change-password')

  And retry(10, 500).waitFor("input[formcontrolname=currentPassword]")
  And input('input[formcontrolname=currentPassword]', 'admin123@')
  And input('input[formcontrolname=newPassword]', 'admin12345@')

  And input('input[formcontrolname=confirmpw]', 'admin12345@')

  And click("//button[contains(., 'Change Password')]")

