Feature: Test for Post

Background:
    Given url "https://reqres.in/" 

Scenario:First Post
    Given path "/api/users"
    And request { "id" : "25" }
    And method Post 
    * def myNum = response.id
    And print(myNum)
    And header Authorization = myNum
    Then status 201
       


