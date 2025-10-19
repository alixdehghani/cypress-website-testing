@reportevauationui
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

  * def countersTab = "//a[text()='KPI Reports Evaluation']"
  And waitFor(countersTab).click()

  And waitForUrl('/performance/kpi-history') 

  * def lanMenuButton = "mat-icon[aria-label='lan']"
  And waitFor(lanMenuButton).click()


 
  * def RABOption = "span[data-name='E-RAB']"
  And waitFor(RABOption).click()
  And delay(1000)

  * def RABSetupOption = "span[data-name='E-RAB Setup Success Rate Added']"
  And waitFor(RABSetupOption).click()
  And delay(1000)

  * def sectorOption = "span[data-name='SECTOR-1']"
  And waitFor(sectorOption).click()
  And delay(1000)



 * def startButton = "//button[.//mat-icon[text()='analytics'] and contains(., 'Evaluate')]"
 And waitFor(startButton).click()

 And delay(5000)


 * def resetButton = "//button[.//mat-icon[text()='close'] and contains(., 'Reset')]"
 And waitFor(resetButton).click()

 And delay(5000)


* def refreshButton = "//mat-icon[text()='refresh']"
And waitFor(refreshButton).click()
And delay(3000)
