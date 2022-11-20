@CreateUser
Feature: Create user with json file

Background:
    * def jsonBody = read('classpath:jsons/PostExample.json')

Scenario:
    Given url "https://reqres.in/api/users"
    And request jsonBody
    When method Post
    Then status 201
