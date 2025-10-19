@reportui
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

  * def countersTab = "//a[text()='Counters Reports']"
  And waitFor(countersTab).click()

  And waitForUrl('/performance/history') 

  * def lanMenuButton = "mat-icon[aria-label='lan']"
  And waitFor(lanMenuButton).click()


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

#   And delay(1000)
#   * def exportButton = "//button[@aria-haspopup='menu'][.//mat-icon[contains(@data-mat-icon-name, 'export')]]"
#   And waitFor(exportButton).click()
  
#   * def exportCsvOption = "//button[contains(., 'Export config as a CSV file')]"
#   And waitFor(exportCsvOption).click()
  
#   * def expectedFileName = 'kpi-history-sector-3 - 10_19_2025 5_39_33 PM.csv' 
#   * def downloadedFile = downloadsDir + '/' + expectedFileName

* def startTimeValue = '2025-10-19T17:00' 
* def endTimeValue   = '2025-10-19T17:30' 


* def startTimeInput = "//mat-label[text()='Select Start Time']/ancestor::mat-form-field//input[@type='datetime-local']"
And waitFor(startTimeInput).input(startTimeValue)

* def endTimeInput = "//mat-label[text()='Select End Time']/ancestor::mat-form-field//input[@type='datetime-local']"
And waitFor(endTimeInput).input(endTimeValue)

* def checkboxLabel = "//label[.//span[contains(., 'Time Independent Kpi')]]"
And waitFor(checkboxLabel).click()

* def submitButton = "//button[contains(., 'Submit')]"
And waitFor(submitButton).click()

  * def refreshButton = "//mat-icon[text()='refresh']"
  And waitFor(refreshButton).click()
  And delay(3000)




