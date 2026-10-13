*** Settings ***
Documentation    SauceDemo cart and checkout workflow keywords.

Resource         ../pages/cart_page.resource
Resource         ../pages/checkout_page.resource
Resource         ../pages/inventory_page.resource
Resource         ../saucedemo_variables.resource


*** Keywords ***
Add Product To Cart
    [Arguments]    ${product_name}
    Add Product From Inventory    ${product_name}

Open Cart
    Open Cart Page
    Cart Should Contain Product    ${PRODUCT_NAME}

Start Checkout
    Go To Checkout Information Page

Submit Customer Information
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Enter Checkout Information    ${first_name}    ${last_name}    ${postal_code}
    Continue To Checkout Overview

Verify Checkout Summary Contains Product
    [Arguments]    ${product_name}
    Checkout Overview Should Show Product    ${product_name}

Complete Order
    Finish Order

Verify Order Confirmation
    Order Confirmation Should Be Shown
