@login
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

  # And click("//mat-icon[text()='person']")
  # And retry(10, 500).waitFor("//*[contains(., 'User Account Management')]")
  # And mouse("//a[contains(., 'User Account Management')]").click()

  # And waitForUrl('/user-management/users-management')
  # And match driver.url == 'https://192.168.140.168/user-management/users-management'
  # And delay(3000)

  # And retry().waitFor("//button[contains(., 'Add New User')]")
  # And mouse("//button[contains(., 'Add New User')]").click()

  
  # * def getFutureDateTime =
  #   """
  #   function() {
  #     var d = new Date();
  #     d.setDate(d.getDate() + 30);
  #     var year = d.getFullYear();
  #     var month = ('0' + (d.getMonth() + 1)).slice(-2);
  #     var day = ('0' + d.getDate()).slice(-2);
  #     var hours = ('0' + d.getHours()).slice(-2);
  #     var minutes = ('0' + d.getMinutes()).slice(-2);
  #     return year + '-' + month + '-' + day + 'T' + hours + ':' + minutes;
  #   }
  #   """
  # * def futureDate = getFutureDateTime()

  # And retry().waitFor('[formcontrolname=username]')
  # And input('[formcontrolname=username]', 'user4')
  # And input('[formcontrolname=password]', 'Password123!')
  # And input('[formcontrolname=confirmpw]', 'Password123!')
  # And input('[formcontrolname=expPassword]', futureDate)

  # And click('[formcontrolname=role]') 
  # And retry().waitFor("//mat-option/span[contains(text(), 'MONITORING')]")
  # And click("//mat-option/span[contains(text(), 'MONITORING')]")

  # And mouse("//button[contains(., 'Save')]").click()

  # And retry().waitFor("//td[text()='newTestUserFromKarate']")

  # And delay(3000)