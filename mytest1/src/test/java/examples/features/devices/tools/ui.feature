@deviceui
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

  * def softwareTab = "//a[.//mat-icon[text()='devices']]"
  And waitFor(softwareTab).click()



  * def lanMenuButton = "mat-icon[aria-label='lan']"
  And waitFor(lanMenuButton).click()


  * def toolsOption = "span[data-name='Tools']"
  And waitFor(toolsOption).click()
  * def powerCalcOption = "span[data-name='Total RRU/RRH Power Calculator']"
  And waitFor(powerCalcOption).click()


  * def powerInput = "input[formcontrolname='LTE_RS_RE_Power_dBm']"

    And waitFor(powerInput)
    And clear(powerInput)
    And input(powerInput, '15.21')
  

    * def radioButtonLabel = "//label[.//span[contains(., 'BW:15 MHz (75 PRB)')]]"
    And waitFor(radioButtonLabel).click()
    And delay(5000)
  














# #   And retry().waitFor("//h2[contains(text(), 'Power Calculator')]") 


#   * def rruPowerInput = "input[formcontrolname='RRU_RRH_Power_Watt']"
# #   And waitFor(rruPowerInput)
# #   And clear(rruPowerInput)
#   And input(rruPowerInput, '30')
#   And delay(50000)

#   * def ltePowerInput = "input[formcontrolname='LTE_RS_RE_Power_dBm']"
# #   And waitFor(ltePowerInput)
# #   And clear(ltePowerInput)
#   And input(ltePowerInput, '15')
#   And delay(50000)
#   * def txModeDropdown = "//mat-select[.//span[text()='2TX']]"
#   And click(txModeDropdown)
# #   And retry().waitFor("//mat-option[contains(., '4TX')]")
#   And click("//mat-option[contains(., '4TX')]")