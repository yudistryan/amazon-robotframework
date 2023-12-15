# ====================================================================================================
*** Settings ***
Resource    general.resource
# ====================================================================================================



# ====================================================================================================
*** Variables ***
${txt_productDetails_title}    //div[@class='inventory_details_name large_size']
${txt_productDetails_desc}    //div[@class='inventory_details_desc large_size']
${txt_productDetails_price}    //div[@class='inventory_details_price']
${btn_backToProductsList}    //button[@id='back-to-products']
# ====================================================================================================



# ====================================================================================================
*** Keywords ***
Click A Product Title
    [Arguments]    ${button}
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${button}

User is Redirected to Relevant Product Details Page
    Wait Until Element Is Visible    ${btn_backToProductsList}

Get Product's Name in Detail Page
    ${product_name}    SeleniumLibrary.Get Element Attribute    ${txt_productDetails_title}    textContent
    RETURN    ${product_name}

Get Product's Price in Detail Page
    ${product_price}    SeleniumLibrary.Get Element Attribute    ${txt_productDetails_price}    textContent
    RETURN    ${product_price}

Product's Name in Details Page Should be Matched
    [Arguments]    ${product_name_list}    ${current_fetched_name}
    Run Keyword And Continue On Failure    Should Contain    ${product_name_list}    ${current_fetched_name}

Product's Price in Details Page Should be Matched
    [Arguments]    ${product_price_list}    ${current_fetched_price}
    Run Keyword And Continue On Failure    Should Contain    ${product_price_list}    ${current_fetched_price}

Go Back to Product List Page
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_backToProductsList}

Verify Success: Redirected to Product Details
    ${names}    Create Product's Title List
    @{product_names}    Get Products Name List
    @{product_prices}    Get Products Price List
    FOR    ${name}    IN    @{names}
        Click a Product Title    ${name}
        User is Redirected to Relevant Product Details Page
        ${current_name}    Get Product's Name in Detail Page
        Product's Name in Details Page Should be Matched    ${product_names}    ${current_name}
        ${current_price}    Get Product's Price in Detail Page
        Product's Price in Details Page Should be Matched    ${product_prices}    ${current_price}
        Go Back to Product List Page
    END
# ====================================================================================================