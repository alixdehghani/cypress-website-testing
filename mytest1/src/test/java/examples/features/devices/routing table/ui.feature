@ruotingui 
Feature: tst for add vlan

Scenario: add vlan

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
  And waitForUrl('/software')


* def softwareTab = "//a[.//mat-icon[text()='devices']]"
And waitFor(softwareTab).click()
And waitForUrl('/software') 


    * def routingTab = "//a[text()='Routing Table']"
  And waitFor(routingTab).click()

  And waitForUrl('/software/route')

  * def deleteButton = "//mat-icon[text()='delete']" 
  And waitFor(deleteButton).click()

  * def yesButton = "//button[contains(., 'Yes')]"
  And waitFor(yesButton).click()




  * def exportButton = "//button[@aria-haspopup='menu'][.//mat-icon[contains(@data-mat-icon-name, 'export')]]"
  And waitFor(exportButton).click()
  
  * def exportCsvOption = "//button[contains(., 'Export Data as a CSV file')]"
  And waitFor(exportCsvOption).click()
  
  * def expectedFileName = 'Routing Table.csv' 
  * def downloadedFile = downloadsDir + '/' + expectedFileName
  
  


  * def addButton = "//mat-icon[text()='add']"
  And waitFor(addButton).click()

  * def destInput = "input[formcontrolname='dest']"
  And retry().waitFor(destInput)


  * def interfaceDropdown = "//mat-label[text()='Choose a v-LAN Name']/ancestor::mat-form-field//mat-select" 
  And click(interfaceDropdown)
  And retry().waitFor("//mat-option[contains(., 'OM - 10.42.208.204')]") 
  And click("//mat-option[contains(., 'OM - 10.42.208.204')]")

  And input(destInput, '0.0.0.0') 



  * def netmaskInput = "input[formcontrolname='destinationNetMask']"
  And waitFor(netmaskInput).input('255.255.255.224') 

  * def gatewayInput = "input[formcontrolname='gateway']"
  And waitFor(gatewayInput).input('10.42.208.193') 

  * def saveButton = "//button[contains(., 'Save')]"
  And waitFor(saveButton).click()

  And delay(10000)

  * def refreshButton = "//mat-icon[text()='refresh']"
  And waitFor(refreshButton).click()



