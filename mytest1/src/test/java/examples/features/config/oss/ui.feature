@ossui
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

 
* def configMenu = "//a[contains(., 'Configuration')]"
And retry(10, 500).waitFor(configMenu)
And click(configMenu)

* def ossTab = "//a[text()='OSS Connection']"
And waitFor(ossTab).click()

And waitForUrl('/configuration/oss-connection')
And delay(1000)

* def exportButton = "//button[@aria-haspopup='menu'][.//mat-icon[contains(@data-mat-icon-name, 'export')]]"
And waitFor(exportButton).click()

* def exportCsvOption = "//button[contains(., 'Export config as a CSV file')]"
And waitFor(exportCsvOption).click()

* def expectedFileName = 'enbConf__sector-3.csv' 
* def downloadedFile = downloadsDir + '/' + expectedFileName

And delay(5000)
 * def numberInput = "input.number"
 And clear(numberInput)
And waitFor(numberInput).input('4')
  And delay(5000)

  * def saveButton = "//mat-icon[text()='save']"

  And waitFor(saveButton).click()
  * def yesButton = "//button[contains(., 'Yes')]"
  And waitFor(yesButton).click()
  And delay(3000)
* def refreshButton = "//mat-icon[text()='refresh']"
And waitFor(refreshButton).click()
