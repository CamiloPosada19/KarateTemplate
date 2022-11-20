Feature: Test for get

Background:
    Given url "https://reqres.in/" 

Scenario:First get
    Given path "/api/users"
    And method Get 
    Then status 200 
    * def idSelected = $.data[1].id
    And print(idSelected)