@softwareapi

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


  # Given path '/software/vlan-add'
  # And header APP = 'SNMP'
  # And request 
  # """
  
  #   {
  #       "_id": "68cfb654632b1fd5f702f063",
  #       "additional_addresses": {
  #           "a1": {
  #               "addr": "12.4.60.17",
  #               "netMask": "24"
  #           },
  #           "a2": {
  #               "addr": "13.54.67.17",
  #               "netMask": "24"
  #           }
  #       },
  #       "id": 125,
  #       "interface": "eth1",
  #       "name": "test2",
  #       "uniqname": "custom"
  #   }
  # """
  # When method post
  # Then status 200
  # And print 'Response: ', response



  # Given path '/software/vlan-get'
  # And header APP = 'SNMP'
  # When method get
  # Then status 200

   # * match $..additional_addresses.a1 contains { 'addr': '#string', 'netMask': '#string' }
  # * print 'Extracted :', dditional_addresses.a1
  # * def addresses = karate.jsonPath(response, '$..additional_addresses') 
  # * print 'Extracted Addresses:', addresses
  
  # * match addresses contains '11.1.22.2'
  # * match addresses contains '1.1.11.1'
#   And match response.id == 20
#   And match response.name == 'TestVLAN'