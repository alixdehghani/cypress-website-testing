@spectrumui
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



    * def spectrumTab = "//a[text()='Spectrum']"
  And waitFor(spectrumTab).click()

  And waitForUrl('/software/spectrum')

  * def lanMenuButton = "mat-icon[aria-label='lan']"
  And waitFor(lanMenuButton).click()

  And delay(3000)

  * def sectorOneOption = "span[data-name='SECTOR-1']"
  And waitFor(sectorOneOption).click()

  * def rx1Option = "//span[normalize-space()='RX1']"
  And waitFor(rx1Option).click()

  * def captureButton = "//button[contains(., 'Capture LTE Signal')]"
  And waitFor(captureButton).click()
  And delay(5000)


* def rx2Option = "//span[normalize-space()='RX2']"
And waitFor(rx2Option).click()
And delay(3000)


* def rx3Option = "//span[normalize-space()='RX3']"
And waitFor(rx3Option).click()
And delay(3000)

* def sector2OneOption = "span[data-name='SECTOR-2']"
And waitFor(sector2OneOption).click()