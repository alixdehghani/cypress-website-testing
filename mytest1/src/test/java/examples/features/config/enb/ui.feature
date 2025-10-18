@enbui
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
And retry().waitFor("//span[contains(text(), 'Select managed object')]")
* def menuButton = "mat-icon[aria-label='lan']"
And retry().waitFor(menuButton)
And click(menuButton)
* def sectorOneLink = "//span[text()='SECTOR-1']"
And waitFor(sectorOneLink).click()

* def enbConfigLink = "//span[text()='eNB_Configuration']"
And waitFor(enbConfigLink).click()

* def enbConfLink = "//span[normalize-space()='eNBConf']"
And waitFor(enbConfLink).click()
And delay(3000)

* def exportButton = "//button[@aria-haspopup='menu'][.//mat-icon[contains(@data-mat-icon-name, 'export')]]"
And waitFor(exportButton).click()

* def exportCsvOption = "//button[contains(., 'Export config as a CSV file')]"
And waitFor(exportCsvOption).click()

* def expectedFileName = 'enbConf__sector-3.csv' 
* def downloadedFile = downloadsDir + '/' + expectedFileName
* def hexInput = "input.hex"

  And waitFor(hexInput).input('12')

  * def saveButton = "//mat-icon[text()='save']"

  And waitFor(saveButton).click()
  * def yesButton = "//button[contains(., 'Yes')]"
  And waitFor(yesButton).click()
  And delay(3000)


* def refreshButton = "//mat-icon[text()='refresh']"
And waitFor(refreshButton).click()
And delay(3000)

* def backupButton = "//mat-icon[text()='settings_backup_restore']"
  And waitFor(backupButton).click()
  * def noButton = "//button[contains(., 'Yes')]"
  And waitFor(noButton).click()
  And delay(3000)











  * def visibleUploadButton = "//mat-icon[text()='upload_file']"
  And waitFor(visibleUploadButton).click()

  * def importOption = "//button[contains(., 'Import eNB Configuration (CSV) for sector-1')]"
  And waitFor(importOption).click()

  * def filePath = '/home/negin/Downloads/enbConf__sector-1.csv' 

  * def hiddenFileInput = 'input[type=file]'
  And waitFor(hiddenFileInput).input(filePath).script("_.dispatchEvent(new Event('change'))")


  * def submitButton = "//button[contains(., 'Submit')]"
  And waitFor(submitButton).click()

  * def yesButton = "//button[.//span[text()='Yes']]"
  And waitFor(yesButton).click()

  And screenshot()
  And delay(3000) 
  * print driver.scriptAll('input[type=file]', '_.outerHTML')








#  * def downloadsDir = karate.properties['user.dir'] + '/target/downloads'

#   * def expectedFileName = 'enbConf__sector-1.csv' 
#   * def downloadedFile = downloadsDir + '/' + expectedFileName
# And delay(3000)
#   * karate.waitFor(() => karate.exists(downloadedFile), 15000, 1000)


# * def expertconfLink = "//span[normalize-space()='expertConf']"
# And waitFor(expertconfLink).click()
# And delay(3000)


# * def filePath = '/home/negin/Downloads/enbConf__sector-1.csv'

# * def hiddenFileInput = 'input[type=file]'

# And waitFor(hiddenFileInput).input(filePath)

# And script(hiddenFileInput, "_.dispatchEvent(new Event('change'))")

#   * def submitButton = "//button[contains(., 'Submit')]"
# #  And waitFor(submitButton).click()

# # And waitFor("//button[contains(., 'Confirm Upload')]").click()
# And delay(3000)

# * def logLink = "//span[normalize-space()='log']"
# And waitFor(logLink).click()
# * def pcapLink = "//span[normalize-space()='pcap']"
# And waitFor(pcapLink).click()

# And delay(5000)
# # * def rfLink = "//span[normalize-space()=rf']"
# # And waitFor(rfLink).click()
# # * def schedureLink = "//span[normalize-space()='schedure']"
# # And waitFor(schedureLink).click()