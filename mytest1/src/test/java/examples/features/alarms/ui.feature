@alarmui
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


    * def alarmsTab = "//a[.//mat-icon[text()='notifications_active']]"
    And waitFor(alarmsTab).click()
  
    And waitForUrl('/alarms/active-alarms')
  
    * def refreshButton1 = "//mat-icon[text()='refresh']"
    And waitFor(refreshButton1).click()
    And delay(1000)
  
    * def checkButton = "//mat-icon[text()='check']"
    And waitFor(checkButton).click()
  
    * def clearChangesButton = "//mat-icon[text()='published_with_changes']"
    And waitFor(clearChangesButton).click()
    * def exportButton = "//button[@aria-haspopup='menu'][.//mat-icon[contains(@data-mat-icon-name, 'export')]]"
    And waitFor(exportButton).click()
  
  * def exportCsvOption = "//button[contains(., 'Export Data as a CSV file')]"
  And waitFor(exportCsvOption).click()

  * def expectedFileName = 'Active Alarms.csv' 
  * def downloadedFile = downloadsDir + '/' + expectedFileName

  * def condition = () => karate.exists(downloadedFile)

  

  @alarms_history_export
Scenario: Verify Alarm History can be exported as a JSON file
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

  * def alarmsTab = "//a[.//mat-icon[text()='notifications_active']]"
  And waitFor(alarmsTab).click()


    * def historyTab = "//a[text()='Alarms History']"
    And waitFor(historyTab).click()
  
    And waitForUrl('/alarms/alarms-history')
    And delay(1000)
    * def exportButton = "//button[@aria-haspopup='menu'][.//mat-icon[contains(@data-mat-icon-name, 'export')]]"
    And waitFor(exportButton).click()
  
    * def exportJsonOption = "//button[contains(., 'Export Data as a json file')]"
    And waitFor(exportJsonOption).click()

    * def expectedFileName1 = 'Alarm History.json' 
    * def downloadedFile1 = downloadsDir + '/' + expectedFileName1
  
     * def condition = () => karate.exists(downloadedFile1)
  
    * def refreshButton2 = "//mat-icon[text()='refresh']"
    And waitFor(refreshButton2).click()
    And delay(3000)

   
 
