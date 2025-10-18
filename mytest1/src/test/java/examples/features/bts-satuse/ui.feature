@btsui
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



  * def lanMenuButton = "mat-icon[aria-label='lan']"
  And waitFor(lanMenuButton).click()


  * def siteRuntimeOption = "span[data-name='Site runtime view']"
  And waitFor(siteRuntimeOption).click()
  And delay(3000)


  * def allOption = "span[data-name='All']"
  And waitFor(allOption).click()
  And delay(3000)

  * def linkStatusOption = "span[data-name='Links Status']"
  And waitFor(linkStatusOption).click()
  And delay(3000)

  * def refreshButton = "//mat-icon[text()='refresh']"
And waitFor(refreshButton).click()
And delay(3000)


  * def fsmftOption = "span[data-name='FSMFT']"
  And waitFor(fsmftOption).click()
  And delay(3000)

  * def refreshButton = "//mat-icon[text()='refresh']"
And waitFor(refreshButton).click()
And delay(3000)

  * def fiberOption = "span[data-name='FIBER-EXT']"
  And waitFor(fiberOption).click()
  And delay(3000)

  * def refreshButton = "//mat-icon[text()='refresh']"
And waitFor(refreshButton).click()
And delay(3000)

  * def retOption = "span[data-name='RET']"
  And waitFor(retOption).click()
  And delay(3000)

  * def refreshButton = "//mat-icon[text()='refresh']"
And waitFor(refreshButton).click()
And delay(3000)

  * def lncelOption = "span[data-name='LNCEL']"
  And waitFor(lncelOption).click()
  And delay(3000)

  * def refreshButton = "//mat-icon[text()='refresh']"
And waitFor(refreshButton).click()
And delay(3000)

  * def CellTab = "//a[text()='Cells']"
    And waitFor(CellTab).click()
    And delay(3000)



* def CELLSOption = "span[data-name='CELLS']"
And waitFor(CELLSOption).click()
And delay(3000)

* def  AllSOption = "span[data-name='All']"
And waitFor(AllSOption).click()
And delay(3000)
* def refreshButton = "//mat-icon[text()='refresh']"
And waitFor(refreshButton).click()
And delay(3000)
* def  sector1SOption = "span[data-name='SECTOR-1']"
And waitFor(sector1SOption).click()
And delay(3000)

* def refreshButton = "//mat-icon[text()='refresh']"
And waitFor(refreshButton).click()
And delay(3000)
* def  sector2Option = "span[data-name='SECTOR-2']"
And waitFor(sector2Option).click()
And delay(3000)
* def refreshButton = "//mat-icon[text()='refresh']"
And waitFor(refreshButton).click()
And delay(3000)
* def  sector3Option = "span[data-name='SECTOR-3']"
And waitFor(sector3Option).click()
And delay(3000)
* def refreshButton = "//mat-icon[text()='refresh']"
And waitFor(refreshButton).click()
And delay(3000)