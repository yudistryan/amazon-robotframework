# ====================================================================================================
*** Settings ***
Resource    general.resource
# ====================================================================================================



# ====================================================================================================
*** Variables ***
# Checkout: Information Page
${unq_checkoutInfoPage}    //span[@class='title'][contains(.,'Checkout: Your Information')]
${inp_firstName_info}    //input[@id='first-name']
${inp_lastName_info}    //input[@id='last-name']
${inp_postalCode_info}    //input[@id='postal-code']
${err_firstNameRequired}    //h3[contains(.,'First Name is required')]
${err_lastNameRequired}    //h3[contains(.,'Last Name is required')]
${err_postalCodeRequired}    //h3[contains(.,'Postal Code is required')]
${btn_cancelInformation}    //button[@id='cancel']
${btn_continueInformation}    //input[@id='continue']

# Checkout: Overview
${unq_checkoutOverviewPage}    //span[@class='title'][contains(.,'Checkout: Overview')]
${txt_paymentInfoValue}    //div[@class='summary_value_label'][1]
${txt_shippingInfoValue}    //div[@class='summary_value_label'][2]
${txt_priceSubtotal}    //div[@class='summary_subtotal_label']
${txt_taxSubtotal}    //div[@class='summary_tax_label']
${txt_priceTotal}    //div[@class='summary_info_label summary_total_label']
${btn_cancelCheckout}    //button[@id='cancel']
${btn_finishCheckout}    //button[@id='finish']

# Checkout: Complete
${unq_checkoutCompletePage}    //span[@class='title'][contains(.,'Checkout: Complete')]
${txt_completeTitle}    //h2[normalize-space()='Thank you for your order!']
${txt_completeSubtitle}    //div[@class='complete-text']
${btn_backToHome}    //button[@id='back-to-products']
# ====================================================================================================



# ====================================================================================================
*** Keywords ***
Checkout Setup
    ${current_url}    Get Location
    IF    $productList_sub_url in $current_url
        Reload Page
    ELSE
        Go To    ${base_url}
        Login As Standard User
    END
    IF    "Empty Cart" not in $TEST_NAME
        Click All Add to Cart Buttons
        Check If Cart Badge is Updated
        Click on Shopping Cart
        Check If All Products are Added to Cart
    END

Checkout Teardown
    Open Sidebar
    Click Element    ${btn_resetAppState_sidebar}

Click on Continue in Information Page
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_continueInformation}

Verify Error: Empty First Name
    Run Keyword And Continue On Failure    Element Should Be Visible    ${err_firstNameRequired}

Verify Error: Empty Last Name
    Run Keyword And Continue On Failure    Element Should Be Visible    ${err_lastNameRequired}

Verify Error: Empty Postal Code
    Run Keyword And Continue On Failure    Element Should Be Visible    ${err_postalCodeRequired}

Input First Name Field
    Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_firstName_info}    John Doe

Input Last Name Field
    Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_lastName_info}    John Doe

Input Postal Code Field
    Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_postalCode_info}    John Doe

Input All Information
    Input First Name Field
    Input Last Name Field
    Input Postal Code Field

Click on Cancel Button in Your Information Page
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_cancelInformation}

Verify Success: Redirected back to Your Cart Page
    Wait Until Element Is Visible    ${unq_yourCartPage}    5s
    Check If All Products are Added to Cart

Verify Success: All Products are Here
    ${names}    Get Products Name List
    ${prices}    Get Products Price List
    ${row_names}    Get Rows' Name List
    ${row_prices}    Get Rows' Price List
    FOR    ${index}    IN RANGE    ${TOTAL_PURCHASED_PRODUCT}
        ${name_locator}    Get From List    ${row_names}    ${index}
        ${price_locator}    Get From List    ${row_prices}    ${index}
        ${product_name}    SeleniumLibrary.Get Element Attribute    ${name_locator}    textContent
        ${product_price}    SeleniumLibrary.Get Element Attribute    ${price_locator}    textContent
        IF    $product_name not in $names and $product_price not in $prices
            Fail    Product is not matched with purchased product from previous page.
        ELSE
            Log    ${product_name} is found in the cart.
        END
    END

Get All Products' Price in Overview
    ${row_prices}    Get Rows' Price List
    @{prices}    Create List    ${EMPTY}
    FOR    ${index}    IN RANGE    ${TOTAL_PURCHASED_PRODUCT}
        ${price_locator}    Get From List    ${row_prices}    ${index}
        ${product_price}    SeleniumLibrary.Get Element Attribute    ${price_locator}    textContent
        IF    ${index} == 0
            Set List Value    ${prices}    0    ${product_price}
        ELSE
            Append To List    ${prices}    ${product_price}
        END
    END
    RETURN    @{prices}

Compute Subtotal: Price From Products in Overview
    ${price_list}    Get All Products' Price in Overview
    ${sum}    Sum All Price    ${price_list}
    RETURN    ${sum}

Compute Subtotal: Tax From Products in Overview
    ${total_purchase}    Compute Subtotal: Price From Products in Overview
    ${tax}    Get Tax    ${total_purchase}
    RETURN    ${tax}

Compute Total Price in Overview
    ${price}    Compute Subtotal: Price From Products in Overview
    ${tax}    Compute Subtotal: Tax From Products in Overview
    ${total}    Evaluate    ${price}+${tax}
    ${total}    Convert To String    ${total}
    RETURN    ${total}

Get All Computation in Overview
    ${subtotal_price}    Compute Subtotal: Price From Products in Overview
    ${subtotal_tax}    Compute Subtotal: Tax From Products in Overview
    ${total}    Compute Total Price in Overview
    @{computed}    Create List    ${subtotal_price}    ${subtotal_tax}    ${total}
    RETURN    @{computed}

Get All System Price Calculation in Overview
    ${subtotal_price}    SeleniumLibrary.Get Element Attribute    ${txt_priceSubtotal}    textContent
    ${subtotal_price}    Get Currency Value    ${subtotal_price}
    ${subtotal_tax}    SeleniumLibrary.Get Element Attribute    ${txt_taxSubtotal}    textContent
    ${subtotal_tax}    Get Currency Value    ${subtotal_tax}
    ${total}    SeleniumLibrary.Get Element Attribute    ${txt_priceTotal}    textContent
    ${total}    Get Currency Value    ${total}
    ${system_computed}    Create List    ${subtotal_price}    ${subtotal_tax}    ${total}
    RETURN    ${system_computed}

Verify Success: Correct Calculation
    @{computed}    Get All Computation in Overview
    @{system_computed}    Get All System Price Calculation in Overview
    FOR    ${index}    ${price}    IN ENUMERATE    @{computed}
        IF    $price == $system_computed[$index]
            Log    ${price} is equal to ${system_computed}[${index}]
        ELSE
            Fail    Calculation is not matched between ${price} and ${system_computed}[${index}]
        END
    END

Click on Cancel Button in Overview Page
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_cancelCheckout}

Click on Finish Button in Overview Page
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_finishCheckout}

Verify Success: Checkout Complete
    Run Keyword And Continue On Failure    Element Should Be Visible    ${unq_checkoutCompletePage}

Click on Back to Homepage Button in Complete Checkout Page
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_backToHome}
# ====================================================================================================
