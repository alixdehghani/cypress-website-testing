@networkapi
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





# Given path '/bts-ntp/configuration'
# And header Authorization = myToken
# When method get
# Then status 200
# And def currentConfig = response





Given path '/bts-ntp/configuration'
And header Authorization = myToken
And request { server : { 0: ["10.14.248.2","[prefer]"],1: ["10.14.248.3"]}}
When method put
Then status 200
