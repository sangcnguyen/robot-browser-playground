*** Settings ***
Documentation    SauceDemo login workflow keywords.

Resource         ../pages/inventory_page.resource
Resource         ../pages/login_page.resource


*** Keywords ***
Open SauceDemo
    Open Login Page

Log In As Standard User
    Submit Login Form    ${USERNAME}    ${PASSWORD}
    Inventory Page Should Be Open
