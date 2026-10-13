*** Settings ***
Documentation    Checkout page locators and browser actions.

Library          Browser


*** Keywords ***
Enter Checkout Information
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Fill Text    id=first-name    ${first_name}
    Fill Text    id=last-name    ${last_name}
    Fill Text    id=postal-code    ${postal_code}

Continue To Checkout Overview
    ${button}=    Get Element By Role    button    name=Continue    exact=True
    Click    ${button}
    Wait For Elements State    .summary_info    visible

Checkout Overview Should Show Product
    [Arguments]    ${product_name}
    Get Text    .cart_item .inventory_item_name    ==    ${product_name}
    Get Text    .summary_info    contains    Total

Finish Order
    ${button}=    Get Element By Role    button    name=Finish    exact=True
    Click    ${button}

Order Confirmation Should Be Shown
    Wait For Elements State    .complete-header    visible
    Get Text    .complete-header    ==    Thank you for your order!

Close Browser
    Browser.Close Browser
