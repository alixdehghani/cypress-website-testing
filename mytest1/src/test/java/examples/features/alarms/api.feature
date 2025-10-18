@alarmapi
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





* def myToken  = response.token
# Given path '/alarms/active-alarms'
# And header Authorization = myToken
# When method get
# Then status 200


# * def myToken  = response.token
# Given path '/alarms/alarms-history'
# And header Authorization = myToken
# When method get
# Then status 200

# Given path '/alarms/ack'
# And header Authorization = myToken
# And request {id : '68cfb655632b1fd5f702f08d',sector	:"common"}
# When method post
# Then status 200

# Given path '/alarm-status'
# And header Authorization = myToken
# When method get
# Then status 200


# Given path '/alarms'
# And header Authorization = myToken
# And request {  timeuint_start: 1760513107 , timeuint_end: 1760772307 }
# When method post
# Then status 200


Given path '/alarms/active-alarms'
And header Authorization = myToken
And request { start_time:1760513107, end_time: 1760772307, sector: 1}
When method post
Then status 200
