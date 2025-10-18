@ping
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


    * def diagnosticsTab = "//a[.//mat-icon[text()='health_and_safety']]"
    And waitFor(diagnosticsTab).click()
  
  
    And waitForUrl('/diagnostic/ping') 
  
 
    * def hostInput = "//mat-label[text()='IP Address or Hostname']/ancestor::mat-form-field//input" 

    And waitFor(hostInput).input('8.8.8.8') 
  
    * def pingButton = "//button[contains(., 'Ping')]"
    And waitFor(pingButton).click()
    And delay(10000)

    * def tracerouteTab = "//a[text()='Traceroute']"

      And waitFor(tracerouteTab).click()
    
 
      And waitForUrl('/diagnostic/traceroute')

      * def hostInput = "//mat-label[text()='IP Address or Hostname']/ancestor::mat-form-field//input" 

    And waitFor(hostInput).input('127.0.0.1') 
  
    * def pingButton = "//button[contains(., 'Traceroute')]"
    And waitFor(pingButton).click()
    And delay(10000)

    * def clearButton = "//mat-icon[text()='clear']"
    And waitFor(clearButton).click()
    And delay(2000)

     * def ossTab = "//a[text()='OSS Task Manager']"
     And waitFor(ossTab).click()

     And waitForUrl('/diagnostic/oss-task-manager')

  
     * def lanMenuButton = "mat-icon[aria-label='lan']"
     And waitFor(lanMenuButton).click()
   

     * def noRealtimeOption = "span[data-name='No Realtime']"
     And waitFor(noRealtimeOption).click()
   
 
     * def refreshButton = "//mat-icon[text()='refresh']"
     And waitFor(refreshButton).click()
   
  