*** Settings ***
Documentation    End-to-end checkout test for the SauceDemo sample shop.

Resource         ../resources/flows/auth.resource
Resource         ../resources/flows/checkout.resource

Test Setup       Open SauceDemo
Test Teardown    Close Browser


*** Test Cases ***
Standard User Can Complete Checkout
    Log In As Standard User
    Add Product To Cart    ${PRODUCT_NAME}
    Open Cart
    Start Checkout
    Submit Customer Information    ${FIRST_NAME}    ${LAST_NAME}    ${POSTAL_CODE}
    Verify Checkout Summary Contains Product    ${PRODUCT_NAME}
    Complete Order
    Verify Order Confirmation
