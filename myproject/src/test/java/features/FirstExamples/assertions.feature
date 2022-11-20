Feature: Main assertions

Background:
    Given url "https://reqres.in"  
    And path "api/users"
    And params {page:1}
    And method Get
    And status 200 

Scenario: Main asserts
    When match response.data[0].email contains "george.bluth@reqres.in"
    And match response.data[0].email !contains "camilo.bluth@reqres.in"
    Then match response.data[0].email == "george.bluth@reqres.in" 

Scenario: Other assertions
    # And match response.data[0] contains any ["george.bluth@reqres.in"]  Only arrays not objects
    # And match response.data[0] contains only ["george.bluth@reqres.in"]  Only arrays not objects              
    And match response.data[0].id == 1
    And match response.data[0].id != 2
    And match response.data[0] == {"id":1,"email":"george.bluth@reqres.in","first_name":"George","last_name":"Bluth","avatar":"https://reqres.in/img/faces/1-image.jpg"}
    Then match response contains {page:"#number"}
  


