*** Settings ***
Documentation    Login test for the SauceDemo sample shop.

Library          Browser


*** Variables ***
${URL}         https://www.saucedemo.com/
${USERNAME}    standard_user
${PASSWORD}    secret_sauce


*** Test Cases ***
Standard User Can Log In
    New Browser    chromium    headless=${False}
    New Page    ${URL}
    Fill Text    id=user-name    ${USERNAME}
    Fill Text    id=password    ${PASSWORD}
    Click    id=login-button
    Wait For Elements State    .inventory_list    visible
    Get Text    .title    ==    Products
    Close Browser
