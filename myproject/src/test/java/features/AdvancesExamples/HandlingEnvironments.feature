Feature: Testing environment variables

Background:
    #Given url "https://reqres.in/"
    Given url entorno
    And print("ESTO ES HEREDADO DE UN ENTORNO"+" "+entorno)

Scenario: Testing with environments
    Given path "/api/users"
    And request { "id" : "25" }
    When method Post
    * def myNum = response.id
    And print(myNum)
    And header Authorization = myNum
    Then status 201

Scenario: Testing with data in environments
    Given path "/api/users"
    And request { "id" : "#(id)" }
    When method Post
    * def myNum = response.id
    And print(myNum)
    And header Authorization = myNum
    Then status 201   