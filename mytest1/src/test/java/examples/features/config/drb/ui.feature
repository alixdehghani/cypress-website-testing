@drbui
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

 
* def configMenu = "//a[contains(., 'Configuration')]"
And retry(10, 500).waitFor(configMenu)
And click(configMenu)



* def drbTab = "//a[text()='DRB']"
And waitFor(drbTab).click()


And waitForUrl('/configuration/drb')

* def lanMenuButton = "mat-icon[aria-label='lan']"
And waitFor(lanMenuButton).click()


* def sectorOneOption = "span[data-name='SECTOR-1']"
And waitFor(sectorOneOption).click()
And delay(3000)

* def drbConfigOption = "span[data-name='DRB_Configuration']"
And waitFor(drbConfigOption).click()

* def qci1Option = "span[data-name='QCI 1']"
And waitFor(qci1Option).click()
And delay(3000)



* def exportButton = "//button[@aria-haspopup='menu'][.//mat-icon[contains(@data-mat-icon-name, 'export')]]"
And waitFor(exportButton).click()

* def exportCsvOption = "//button[contains(., 'Export config as a CSV file')]"
And waitFor(exportCsvOption).click()

* def expectedFileName = 'DRBConf__sector-3.csv' 


* def refreshButton = "//mat-icon[text()='refresh']"
And waitFor(refreshButton).click()
And delay(3000)


* def refreshButton = "//mat-icon[text()='refresh']"
And waitFor(refreshButton).click()
And delay(1000)

* def restoreButton = "//mat-icon[text()='settings_backup_restore']"
And waitFor(restoreButton).click()

* def yesButton = "//button[contains(., 'Yes')]"
And waitFor(yesButton).click()
