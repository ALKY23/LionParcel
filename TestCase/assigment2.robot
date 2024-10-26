*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/resources.robot

*** Test Cases ***

Scenario: User logs in successfully
    Given the user opens the browser to the login page    https://www.saucedemo.com/    chrome
    When the user input valid login credentials    standard_user    secret_sauce
    And the user clicks the login button
    Then the user should be logged in successfully

Scenario: User checks out items in the cart
    Given the user is logged in
    When the user on the product page user add item to the cart and proceeds to checkout
    And the user input checkout information    haikal    test    12345
    Then the checkout overview page should display the selected items
    and the user completes the purchase




