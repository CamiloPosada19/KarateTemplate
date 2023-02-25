@CreateUser
Feature: Create user with json file and login with another user

Background:
    * def jsonBody = read('classpath:jsons/PostExample.json')

Scenario:
    Given url "https://reqres.in/api/users"
    And request jsonBody
    # Title of the karate report should go before the method get,post,put.
    And header karate-name = 'Creación de un usuario'
    When method Post
    Then status 201
    And print response
    # Delete user

    * karate.pause(1000)
    Given url entorno
    When path '/api/login'
    And request 
    """
        {
        "email": "eve.holt@reqres.in",
        "password": "cityslicka"
    }

    """
    # Title of the karate report should go before the method get,post,put.
    And header karate-name = 'Eliminacion de un usuario'    
    And method post 
    Then status 200
    And print response