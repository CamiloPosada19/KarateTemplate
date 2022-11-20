Feature: Testing tables

    Background:
        Given url "https://reqres.in/"

    Scenario:First Post with tables Example
        Given path "/api/users"
        * table json
            | id |
            | 25 |
        When request json
        And print(json.id)
        And method Post
        * def myNum = response.id
        And print(myNum)
        And header Authorization = myNum
        Then status 201

    Scenario Outline: Testing with differents users
        Given path "/api/users"
        And request { "id" : "#(id)" }
        When method Post
        * def myNum = response.id
        And print(myNum)
        And header Authorization = myNum
        Then status 201

        Examples:
            | id |
            | 25 |
            | 30 |
            | 50 |



