*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary

*** Variables ***
${title}    Swag Labs

*** Keywords ***
I have a base URL of
    [Arguments]     ${base_url}
    Set Suite Variable   ${base_url}

I have an user ID of
    [Arguments]     ${user_id}
    Set Suite Variable   ${user_id}

I send a GET request
    ${singleUser}=     GET    ${base_url}/${user_id}
    Set Suite Variable   ${singleUser}
    
I input an user data
    [Arguments]    ${name}    ${job}
    ${data}=    Evaluate    {"name": "${name}", "job": "${job}"}
    Set Suite Variable    ${data}

I send a POST request
    ${createUser}=     POST    ${base_url}    ${data}
    Set Suite Variable  ${createUser}

the respond status get user should be
       [Arguments]        ${response}
       Status Should Be   ${response}       ${singleUser}

the respond status created user should be
    [Arguments]        ${response}
    Status Should Be   ${response}       ${createUser}

the user opens the browser to the login page
    [Arguments]    ${url}    ${browser}
    Open Browser   ${url}    ${browser}

the user input valid login credentials
    [Arguments]    ${user}    ${pw}
    Input Text    id:user-name    ${user}
    Input Text    id:password     ${pw}

the user clicks the login button
    Click Button    id:login-button

the user should be logged in successfully
    Title Should Be    ${title}
    Log To Console   currently on the page : ${title}

the user is logged in
    Element Should Be Visible    id:react-burger-menu-btn
    Element Should Be Visible    id:shopping_cart_container

the user on the product page user add item to the cart and proceeds to checkout
    Click Button    id:add-to-cart-sauce-labs-backpack
    Element Should Be Visible    class:shopping_cart_badge
    Click Element   class:shopping_cart_badge
    Element Should Be Enabled    id:checkout
    Click Button    id:checkout

the user input checkout information
    [Arguments]    ${fname}    ${lname}    ${pcode}
    Input Text    name:firstName        ${fname}
    Input Text    name:lastName         ${lname}
    Input Text    name:postalCode       ${pcode}
    Click Button    id:continue

the checkout overview page should display the selected items
    ${desc}=    Set Variable         xpath://div[@data-test="inventory-item-name" and contains(text(), "Sauce Labs Backpack")]
    Element Should Be Visible    ${desc}
    Click Button    id:finish

the user completes the purchase
    Element Should Be Visible    xpath=//*[@class="complete-header" and text()="Thank you for your order!"]
    Element Should Be Visible    xpath=//*[@class="title" and text()="Checkout: Complete!"]




