@networkui
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
    * def downloadsDir = karate.properties['user.dir'] + '/target/downloads'

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

  * def softwareTab = "//a[.//mat-icon[text()='devices']]"
  And waitFor(softwareTab).click()


  * def networkTab = "//a[text()='Network Time Protocol']"
  And waitFor(networkTab).click()


  * def lanMenuButton = "mat-icon[aria-label='lan']"
  And waitFor(lanMenuButton).click()



 * def NTPOption = "span[data-name='NTP']"
And waitFor(NTPOption).click()
And delay(3000)

  * def  statusButton = "span[data-name='status']"
  And waitFor( statusButton).click()
  
 * def  peerlistButton = "span[data-name='peerlist']"
  And waitFor( peerlistButton).click()

    
   * def  configurationButton = "span[data-name='configuration']"
   And waitFor( configurationButton).click()

   * def addressInput = "//mat-label[text()='server-0']/ancestor::mat-form-field//input"

  And waitFor(addressInput)
  And clear(addressInput)
  And input(addressInput, '192.168.1.100') 



  * def restoreButton = "//button[.//mat-icon[text()='refresh'] and contains(., 'Restore To Default')]"
  And waitFor(restoreButton).click()
  * def yesButton = "//button[contains(., 'Yes')]"
  And waitFor(yesButton).click()

And delay(5000)

  * def addServerButton = "//button[.//mat-icon[text()='add'] and contains(., 'Add Server')]"
  And waitFor(addServerButton).click()


  * def serverInput = "//mat-label[text()='server-2']/ancestor::mat-form-field//input"
  And retry().waitFor(serverInput) 
  And clear(serverInput)


  And input(serverInput, '192.168.1.200') 


  * def saveButton = "//button[.//mat-icon[text()='save'] and contains(., 'Save')]"
  And waitFor(saveButton).click()

