@kpiui
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
  And delay(5000)



  * def countersTab = "//a[text()='KPI Instant View']"
  And waitFor(countersTab).click()
  And delay(5000)

  And waitForUrl('/performance/kpi-instance-view') 
  And delay(5000)
