*** Settings ***
Documentation    Cart page locators and browser actions.

Library          Browser


*** Keywords ***
Open Cart Page
    Click    .shopping_cart_link
    Wait For Elements State    .cart_list    visible

Cart Should Contain Product
    [Arguments]    ${product_name}
    Get Text    .cart_item .inventory_item_name    ==    ${product_name}

Go To Checkout Information Page
    ${button}=    Get Element By Role    button    name=Checkout    exact=True
    Click    ${button}
    Wait For Elements State    id=first-name    visible
