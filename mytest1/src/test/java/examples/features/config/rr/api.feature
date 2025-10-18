@rrapi
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

Given path '/sector-1/configuration/setting/rr'
And header Authorization = myToken
When method get
Then status 200




Given path '/sector-1/configuration/rr'
And header Authorization = myToken
When method get
Then status 200
* def currentConfig = response

* set currentConfig.periodic_phr_timer	 = 60

Given path '/sector-1/configuration/rr'
And header Authorization = myToken
And request currentConfig
When method post
Then status 200