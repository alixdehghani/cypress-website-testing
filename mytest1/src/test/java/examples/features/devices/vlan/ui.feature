@softwareui 
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

* def vlanTab = "//a[text()='Virtual LAN']"

And waitFor(vlanTab).click()

And waitForUrl('/software/vlan')
And delay(3000)


* def refreshButton = "//mat-icon[text()='refresh']"
  And waitFor(refreshButton).click()
  And delay(1000) 

  * def addButton = "//mat-icon[text()='add']"
  And waitFor(addButton).click()


 And retry().waitFor("input[formcontrolname=id]")

  * def interfaceDropdown = "mat-select[formcontrolname='interface']" 
   And click(interfaceDropdown)
   And retry().waitFor("//mat-option[contains(., 'eth1')]") 
   And click("//mat-option[contains(., 'eth1')]")
 
 And input("input[formcontrolname=id]", "141")
 
 * def typeDropdown = "//mat-label[text()='Type']/ancestor::mat-form-field//mat-select"
 And click(typeDropdown)
 And retry().waitFor("//mat-option[contains(., 'custom')]") 
 And click("//mat-option[contains(., 'custom')]")

 And input("[formcontrolname=name]", 'VLAN')
 And delay(5000)

 * def addVlanButton = "//button[contains(., 'Save')]"
   And click(addVlanButton)

    And delay(3000)

