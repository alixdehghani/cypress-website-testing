@deleteapi
Feature: Teat API Format

Background:
  * url 'https://localhost:8080'
  * configure ssl = { trustAll: true }

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
Given path '/user-management/delete-user'
And header Authorization = myToken
And request { "username": "testi" }
When method delete
Then status 200