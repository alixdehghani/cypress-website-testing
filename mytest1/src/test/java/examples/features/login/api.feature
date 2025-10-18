@api
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














  # Given path '/addr-status'
  # And header APP = 'SNMP'
  # When method get
  # Then status 200



  
 







  # Given path '/common/setting/mml-cmd'
  # And header Authorization = myToken
  # When method get
  # Then status 200
  
  # Given path '/sector-1/performance/kpi/stream'
  # And header Authorization = myToken
  # When method get
  # Then status 200

  # Given path '/performance/ims/users'
  # And header Authorization = myToken
  # When method get
  # Then status 200

  




# Scenario: Filter VLANs with 'a1' key in additional_addresses

#   Given path '/software/vlan-get'
#   And header APP = 'SNMP'
#   When method get
#   Then status 200

 
#   * def filtered_items = karate.jsonPath(response, "$[?(@.additional_addresses && @.additional_addresses.a1)]")
  
#   * print 'Number of filtered items:', filtered_items.length
#   * print 'Filtered Items:', filtered_items
#   * assert filtered_items.length > 0
#   * match each filtered_items contains { additional_addresses: { a1: '#object' } }



