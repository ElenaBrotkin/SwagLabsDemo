*** Settings ***
Library    SeleniumLibrary

Suite Teardown    Close browser

*** Variables ***
${SiteUrl}     file:///C:/Users/student/Downloads/swag_labs%20(1).html
${Browser}     headlesschrome

*** Test Cases ***
Logging Test
    Open browser    ${SiteUrl}  ${Browser}
    Maximize browser window
    Wait until element is visible   id=login-button
    Input text    id:username   standard_user
    Input text    id:password   secret_sauce
    Click button    id:login-button
    Sleep   2

Shopping Cart Test
    Click button    xpath://*[@id="products-grid"]/div[1]/button
    Click button    xpath://*[@id="products-grid"]/div[2]/button
    Click button    xpath://*[@id="products-grid"]/div[4]/button

    Click element    xpath://*[@id="product-page"]/div[1]/div/div

Checkout Test
    Click button    xpath://*[@id="cart-items"]/div[2]/button

    Input text    id:first-name     Service
    Input text  id:last-name    User
    Input text    id:postal-code    50100

    Click button    xpath://*[@id="checkout-page"]/div[2]/button

Confirmation Test
    Wait until page contains    Thank You For Your Order!

