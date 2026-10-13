*** Settings ***
Documentation    Inventory page locators and browser actions.

Library          Browser


*** Keywords ***
Inventory Page Should Be Open
    Wait For Elements State    .inventory_list    visible
    Get Text    .title    ==    Products

Add Product From Inventory
    [Arguments]    ${product_name}
    Click    .inventory_item:has(.inventory_item_name:text-is("${product_name}")) >> role=button[name="Add to cart"]
    Get Text    .shopping_cart_badge    ==    1
