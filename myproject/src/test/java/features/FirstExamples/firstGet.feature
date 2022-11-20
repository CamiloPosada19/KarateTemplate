
Feature: Test for get

Background:
    Given url "https://reqres.in/" 

Scenario:First get
    Given path "/api/users"
    And method Get 
    Then status 200  

Scenario: Get with a param
    Given param page = 1
    When path "/api/users"
    And method Get
    Then status 200

Scenario: Get with multiples params
    Given params {page:1,limit:2}
    When path "/api/users"
    And method Get
    Then status 200    
    
