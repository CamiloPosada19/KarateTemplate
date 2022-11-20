@debug
Feature: Calling data the other feature

Background:
    Given url "https://reqres.in/"
    #Given url entorno
    * def tokenResponse = call read('classpath:Helpers/Token.feature')
    * def id = tokenResponse.idSelected
    * def idFeature = id
    And print("lEYENDO"+idFeature)
Scenario: Testing with other features
    Given path "/api/users"
    And request {"id":"254"}
    And request idFeature
    When method Post
    * def myNum = response.id
    And header Authorization = myNum
    Then status 201