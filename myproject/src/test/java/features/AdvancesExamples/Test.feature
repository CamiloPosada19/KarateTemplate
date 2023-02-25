Feature: Test

Scenario:   Prueba
    * def array = [3,4]
    * def array2 = karate.append(array,[5,6])
    #And print(array2)

Scenario Outline:
    
    * def variables = call read('classpath:AdvanceExamples/test.feature')
    Given print(variables)

    Examples:
            | id |
            | 25 |
            | 50 |


