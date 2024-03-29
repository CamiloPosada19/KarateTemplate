@CreateUser
Feature: Create user with json file and login with another user

Background:
    * def jsonBody = read('classpath:jsons/PostExample.json')

Scenario:
    Given url "https://reqres.in/api/users"
    And request jsonBody
 
    When method Post
    Then status 201
    And print response
    # Delete user
    Given url entorno
    When path '/api/login'
    And request 
    """
        {
        "email": "eve.holt@reqres.in",
        "password": "cityslicka"
    }

    """   
    And method post 
    Then status 200
    And print response