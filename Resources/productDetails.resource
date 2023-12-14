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
Verify Success: Redirected to Product Details
    ${names}    Create Product's Title List
    @{product_names}    Products Name List
    @{product_prices}    Products Price List
    FOR    ${name}    IN    @{names}
        Wait Until Keyword Succeeds    10s    1s    Click Element    ${name}
        Wait Until Element Is Visible    ${btn_backToProductsList}
        ${current_name}    SeleniumLibrary.Get Element Attribute    ${txt_productDetails_title}    textContent
        Run Keyword And Continue On Failure    Should Contain    ${product_names}    ${current_name}
        ${current_price}    SeleniumLibrary.Get Element Attribute    ${txt_productDetails_price}    textContent
        Run Keyword And Continue On Failure    Should Contain    ${product_prices}    ${current_price}
        Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_backToProductsList}
    END
# ====================================================================================================