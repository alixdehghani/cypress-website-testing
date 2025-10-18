@pingapi
Feature: Teat API Format

Background:
  * url 'https://localhost:8080'
  * configure ssl = { trustAll: true }
  * configure readTimeout = 15000


Scenario: Test VLAN creation with correct format and authentication

#   Given path '/configuration/snmp'
#   And header APP = 'SNMP'
#   When method get
#   Then status 200

  Given path '/login'
  When method get
  Then status 200
  * def captchaId = response.captchaid
  


Given path '/login'
And request { username: 'superuser', password: 'admin12345@', captcha:'555555' , captchaid:'#(captchaId)'}
When method post
Then status 200

# * def myToken  = response.token
# Given path '/diagnostic/ping'
# And header Authorization = myToken
# And request {ip:'8.8.8.8'}
# When method post
# Then status 200



# * def myToken  = response.token
# Given path '/diagnostic/traceroute'
# And header Authorization = myToken
# And request {ip:'127.0.0.1'}
# When method post
# Then status 200



