*** Settings ***
Library    RequestsLibrary
Resource   ../Resources/resources.robot

*** Test Cases ***

Scenario : GET SINGLE USER
    Given I have a base URL of    https://reqres.in/api/users
    And I have an user ID of        1
    When I send a GET request
    Then the respond status get user should be     200

Scenario : CREATE USER
    Given I have a base URL of    https://reqres.in/api/users
    And I input an user data       morpheus    leader
    When I send a POST request
    Then the respond status created user should be    201









    

