*** Settings ***
Documentation    Login page locators and browser actions.

Library          Browser
Resource         ../saucedemo_variables.resource


*** Keywords ***
Open Login Page
    New Browser    chromium    headless=${HEADLESS}
    New Context
    New Page    ${BASE_URL}
    Wait For Elements State    id=user-name    visible

Submit Login Form
    [Arguments]    ${username}    ${password}
    Fill Text    id=user-name    ${username}
    Fill Text    id=password    ${password}
    ${button}=    Get Element By Role    button    name=Login    exact=True
    Click    ${button}
