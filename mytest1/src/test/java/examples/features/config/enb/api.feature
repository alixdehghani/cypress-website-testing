@enbapi
Feature: Teat API Format

Background:
  * url 'https://localhost:8080'
  * configure ssl = { trustAll: true }
  * configure readTimeout = 15000


Scenario: Test VLAN creation with correct format and authentication

  Given path '/login'
  When method get
  Then status 200
  * def captchaId = response.captchaid
  


Given path '/login'
And request { username: 'superuser', password: 'admin12345@', captcha:'555555' , captchaid:'#(captchaId)'}
When method post
Then status 200


 * def myToken  = response.token




# Given path '/sector-1/configuration/setting/enb'
# And header Authorization = myToken
# When method get
# Then status 200




Given path '/sector-1/configuration/enb'
And header Authorization = myToken
When method get
Then status 200
* def currentConfig = response

* set currentConfig.cpri_ant_en_2 = '3'

Given path '/sector-1/configuration/enb'
And header Authorization = myToken
And request currentConfig
When method post
Then status 200
