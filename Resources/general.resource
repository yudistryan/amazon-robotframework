# ====================================================================================================
*** Settings ***
Resource    imports.resource
# ====================================================================================================



# ====================================================================================================
*** Keywords ***
General Suite Setup
    Open Browser    ${base_url}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${unq_loginPage}

End Testing
    Close Browser

Create Invalid Usernames
    @{invalid_usernames}    Create List    ${invalid_username1}    ${invalid_username2}    ${invalid_username3}
    ...    ${invalid_username4}    ${invalid_username5}    ${invalid_username6}
    RETURN    @{invalid_usernames}

Login As Standard User
    Input Standard Username
    Input Valid Password
    Submit Login
    Verify Success: Logged In
    Verify Success: All Images are Relevant

Product Details List
    ${products}    Create List    ${details_backpack}    ${details_bikeLight}    ${details_boltTshirt}
    ...    ${details_fleeceJacket}    ${details_onesie}    ${details_redTshirt}
    RETURN    @{products}

Get Products Name List
    ${products}    Product Details List
    @{names}    Create List    ${EMPTY}
    FOR    ${product}    IN    @{products}
        IF    $products.index($product) == 0
            Set List Value    ${names}    0    ${product}[name]
        ELSE
            Append To List    ${names}    ${product}[name]
        END
    END
    RETURN    @{names}

Get Products Price List
    ${products}    Product Details List
    @{prices}    Create List    ${EMPTY}
    FOR    ${product}    IN    @{products}
        IF    $products.index($product) == 0
            Set List Value    ${prices}    0    ${product}[price]
        ELSE
            Append To List    ${prices}    ${product}[price]
        END
    END
    RETURN    @{prices}
# ====================================================================================================