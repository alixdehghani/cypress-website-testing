Feature: Teat API Format

Background:
  * url 'https://localhost:8080'
  * configure ssl = { trustAll: true }

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
# Given path '/user-management/users'
# And header Authorization = myToken
# When method get   
# Then status 200
  

# * def myToken  = response.token
# Given path '/user-management/add-user'
# And header Authorization = myToken
# And request { access_list: null, invalid_login_attempt: 0, last_login_time: "", password_expire: -1, register_date: "2025-10-07 09:10:58", role: "MONITORING", username: "testi", password: "test56789@", confirmpw: "test56789@" }
# When method post
# Then status 200





# * def myToken  = response.token
# Given path '/user-management/change-password'
# And header Authorization = myToken
# And request { current_password:	"test12345@",new_password:	"admin12345@", username:	"superuser"}
# When method put
# Then status 200

# * def myToken  = response.token
# Given path '/user-management/reset-password'
# And header Authorization = myToken
# And request {   password:	"qq12345@",  username:	"testi"}
# When method put
# Then status 200




# * def myToken  = response.token
# Given path '/user-management/edit-role'
# And header Authorization = myToken
# And request {   role: "INTERMEDIATE",  username:	"testi"}
# When method put
# Then status 200



# * def myToken  = response.token
# Given path '/user-management/edit-password-exp-date'
# And header Authorization = myToken
# And request {   password_expire:	1456120000,  username:	"testi"}
# When method put
# Then status 200

