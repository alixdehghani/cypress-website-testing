@monitoringui
Feature: monitoring

Scenario: login and see counter monitoring

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

  * def PerformanceTab = "//a[contains(., 'Performance')]"
  And retry(10, 500).waitFor(PerformanceTab)
  And click(PerformanceTab)



  * def countersTab = "//a[text()='Counters Monitoring']"
  And waitFor(countersTab).click()

  And waitForUrl('/performance/counter') 

  * def lanMenuButton = "mat-icon[aria-label='lan']"
  And waitFor(lanMenuButton).click()

  * def diagramOption = "span[data-name='DiagramI']"
  And waitFor(diagramOption).click()
  And delay(1000)

  * def sectorOption = "span[data-name='SECTOR-1']"
  And waitFor(sectorOption).click()
  And delay(1000)

  * def dlOption = "span[data-name='DL']"
  And waitFor(dlOption).click()
  And delay(1000)

  * def firstCheckboxLabelLocator = "//label[.//span[@data-name='dl_bitrate']]"
  And retry().waitFor(firstCheckboxLabelLocator)
  And delay(1000)


  * def cb1Label = firstCheckboxLabelLocator
  And waitFor(cb1Label).click()


  * def cb2Label = "//label[.//span[@data-name='dl_use_avg']]"
  And waitFor(cb2Label).click()

  And delay(1000)

  * def cb3Label = "//label[.//span[@data-name='nof_fail_pdcp_pak']]"
  And waitFor(cb3Label).click()
  And delay(1000)


  * def dateTimeValue = '2025-10-19T17:00'

  * def dateTimeValue1 = '2025-10-19T20:00'

  * def dateTimeInput = "input[type='datetime-local']"
  And waitFor(dateTimeInput).input(dateTimeValue)

  

  * def checkboxLabel = "//label[.//span[contains(., 'Time Independent Kpi')]]"
  And waitFor(checkboxLabel).click()

  * def submitButton = "//button[contains(., 'Submit')]"
  And waitFor(submitButton).click()