# ====================================================================================================
*** Settings ***
Resource    general.resource
# ====================================================================================================



# ====================================================================================================
*** Variables ***
# Page Unique Elements
${unq_yourCartPage}    //span[@class='title'][contains(.,'Your Cart')]

# Product Titles
# Not an exact product, it's precisely to address the first until sixth row of product's name in 'Your Cart' page.
${txt_first_name_cart}        //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[3]/div[2]/a[1]/div[1]
${txt_second_name_cart}        //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[4]/div[2]/a[1]/div[1]
${txt_third_name_cart}        //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[5]/div[2]/a[1]/div[1]
${txt_fourth_name_cart}    //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[6]/div[2]/a[1]/div[1]
${txt_fifth_name_cart}        //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[7]/div[2]/a[1]/div[1]
${txt_sixth_name_cart}    //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[8]/div[2]/a[1]/div[1] 
    
# Product Prices
# Not an exact product, it's precisely to address the first until sixth row of product's price in 'Your Cart' page.
${txt_first_price_cart}    //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[3]/div[2]/div[2]/div[1]
${txt_second_price_cart}    //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[4]/div[2]/div[2]/div[1]
${txt_third_price_cart}    //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[5]/div[2]/div[2]/div[1]
${txt_fourth_price_cart}    //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[6]/div[2]/div[2]/div[1]
${txt_fifth_price_cart}    //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[7]/div[2]/div[2]/div[1]
${txt_sixth_price_cart}    //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[8]/div[2]/div[2]/div[1]

${btn_continueShopping}    //button[@id='continue-shopping']
${btn_checkout}    //button[@id='checkout']
# ====================================================================================================



# ====================================================================================================
*** Keywords ***

Get Rows' Name List
    ${names}    Create List    ${txt_first_name_cart}    ${txt_second_name_cart}    ${txt_third_name_cart}
    ...    ${txt_fourth_name_cart}    ${txt_fifth_name_cart}    ${txt_sixth_name_cart}
    RETURN    ${names}

Get Rows' Price List
    ${prices}    Create List    ${txt_first_price_cart}    ${txt_second_price_cart}    ${txt_third_price_cart}
    ...    ${txt_fourth_price_cart}    ${txt_fifth_price_cart}    ${txt_sixth_price_cart}
    RETURN    ${prices}

Check If Cart Badge is Updated
    ${element_count}    SeleniumLibrary.Get Element Count    ${btn_wildcard_removeFromCart}
    ${total_product}    SeleniumLibrary.Get Element Attribute    ${img_cartBadge}    textContent
    ${total_product}    Convert To Integer    ${total_product}
    Set Global Variable    ${TOTAL_PURCHASED_PRODUCT}    ${total_product}
    Run Keyword And Continue On Failure    Should Be Equal    ${total_product}    ${element_count}

Check If All Products are Added to Cart
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

Verify Success: Empty Cart
    Run Keyword And Continue On Failure    Element Should Not Be Visible    ${txt_first_name_cart}
    Run Keyword And Continue On Failure    Element Should Not Be Visible    ${txt_first_price_cart}

Click on Continue Shopping Button
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_continueShopping}

Verify Success: Redirected Back to Product List
    Wait Until Element Is Visible    ${unq_appPage}    5s
    Verify Success: All Images are Relevant

Click on Checkout Button
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_checkout}
    Wait Until Element Is Visible    ${unq_checkoutInfoPage}
# ====================================================================================================
