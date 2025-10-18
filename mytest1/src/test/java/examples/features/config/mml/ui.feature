@mmlui
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

   
* def configMenu = "//a[contains(., 'Configuration')]"
And retry(10, 500).waitFor(configMenu)
And click(configMenu)
And waitForUrl('/configuration/enb')



* def mmlTab = "//a[text()='MML Command']"
And waitFor(mmlTab).click()


And waitForUrl('/configuration/mml-command')

* def lanMenuButton = "mat-icon[aria-label='lan']"
And waitFor(lanMenuButton).click()

* def lstOption = "span[data-name='LST']"
And waitFor(lstOption).click()

* def lstEnbOption = "span[data-name='LST enb.enb']"
And waitFor(lstEnbOption).click()


* def checkbox1 = "//mat-checkbox[.//span[contains(., 'tac')]]" 
And waitFor(checkbox1).click()

* def checkbox2 = "//mat-checkbox[.//span[contains(., 'sec2_geran_ci')]]" 
And waitFor(checkbox2).click()

* def playButton = "//button[.//mat-icon[text()='play_arrow']]"
And waitFor(playButton).click()


* def clearButton = "//button[@mattooltip='Clear History']"
And waitFor(clearButton).click()

And delay(3000)


* def lstOption = "span[data-name='LST enbEnb']"
And waitFor(lstOption).click()


* def playButton = "//button[.//mat-icon[text()='play_arrow']]"
And waitFor(playButton).click()


* def lstexpertOption = "span[data-name='LST enb.expert']"
And waitFor(lstexpertOption).click()


* def checkbox1 = "//mat-checkbox[.//span[contains(., 'handover_drb_id')]]" 
And waitFor(checkbox1).click()
And delay(5000)

* def checkbox2 = "//mat-checkbox[.//span[contains(., 'bi_flag')]]" 
And waitFor(checkbox2).click()
And delay(5000)

* def checkbox3 = "//mat-checkbox[.//span[contains(., 'csfb_geran_list')]]" 
And waitFor(checkbox3).click()
And delay(5000)
* def playButton = "//button[.//mat-icon[text()='play_arrow']]"
And waitFor(playButton).click()


* def clearButton = "//button[@mattooltip='Clear History']"
And waitFor(clearButton).click()

And delay(3000)

* def lstOption = "span[data-name='DSP']"
And waitFor(lstOption).click()


* def lstEnbOption = "span[data-name='DSP enb.enb']"
And waitFor(lstEnbOption).click()


* def checkbox1 = "//mat-checkbox[.//span[contains(., 'tac')]]" 
And waitFor(checkbox1).click()
And delay(7000)
* def checkbox2 = "//mat-checkbox[.//span[contains(., 'sec2_geran_ci')]]" 
And waitFor(checkbox2).click()
And delay(5000)
* def playButton = "//button[.//mat-icon[text()='play_arrow']]"
And waitFor(playButton).click()
And delay(7000)

# * def clearButton = "//button[@mattooltip='Clear History']"
# And waitFor(clearButton).click()

And delay(3000)


* def lstOption = "span[data-name='QRY']"
And waitFor(lstOption).click()
And delay(5000)


* def QRYOption = "span[data-name='QRY cell']"
And waitFor(QRYOption).click()
And delay(5000)


* def playButton = "//button[.//mat-icon[text()='play_arrow']]"
And waitFor(playButton).click()
And delay(5000)



