# ====================================================================================================
*** Settings ***
Resource    general.resource
# ====================================================================================================



# ====================================================================================================
*** Variables ***
# Page Unique Elements
${unq_appPage}    //div[@class='app_logo']

# Shopping Cart
${btn_cartTop}    //a[@class='shopping_cart_link']

# Sidebar Menu
${btn_burger_sidebar}    //img[@alt='Open Menu']
${btn_allItems_sidebar}    //a[@id='inventory_sidebar_link']
${btn_about_sidebar}    //a[@id='about_sidebar_link']
${btn_logout_sidebar}    //a[@id='logout_sidebar_link']
${btn_resetAppState_sidebar}    //a[@id='reset_sidebar_link']
${btn_close_sidebar}    //button[@id='react-burger-cross-btn']

# Sort Feature Elements
${txt_activeSort}    //span[@class='active_option']
${drd_sortProduct}    //select[@class='product_sort_container']
${opt_name_az}    //option[@value='az']
${opt_name_za}    //option[@value='za']
${opt_price_lohi}    //option[@value='lohi']
${opt_price_hilo}    //option[@value='hilo']

# Products Image
${img_sauceLabsBackpack}    //img[@alt='Sauce Labs Backpack']
${img_sauceLabsBike}    //img[@alt='Sauce Labs Bike Light']
${img_sauceLabsBoltTshirt}    //img[@alt='Sauce Labs Bolt T-Shirt']
${img_sauceLabsFleeceJacket}    //img[@alt='Sauce Labs Fleece Jacket']
${img_sauceLabsOnesie}    //img[@alt='Sauce Labs Onesie']
${img_sauceLabsRedTshirt}    //img[@alt='Test.allTheThings() T-Shirt (Red)']

# Products Title
${txt_backpack_title}    //div[@class='inventory_list']/div[1]/div[2]/div[1]/a[1]/div[1]
${txt_bikeLight_title}    //div[@class='inventory_list']/div[2]/div[2]/div[1]/a[1]/div[1]
${txt_boltTshirt_title}    //div[@class='inventory_list']/div[3]/div[2]/div[1]/a[1]/div[1]
${txt_fleeceJacket_title}    //div[@class='inventory_list']/div[4]/div[2]/div[1]/a[1]/div[1]
${txt_onesie_title}    //div[@class='inventory_list']/div[5]/div[2]/div[1]/a[1]/div[1]
${txt_redTshirt_title}    //div[@class='inventory_list']/div[6]/div[2]/div[1]/a[1]/div[1]

# Products Description
${txt_backpack_desc}    //div[@class='inventory_list']/div[1]/div[2]/div[1]/div[1]
${txt_bikeLight_desc}    //div[@class='inventory_list']/div[2]/div[2]/div[1]/div[1]
${txt_boltTshirt_desc}    //div[@class='inventory_list']/div[3]/div[2]/div[1]/div[1]
${txt_fleeceJacket_desc}    //div[@class='inventory_list']/div[4]/div[2]/div[1]/div[1]
${txt_onesie_desc}    //div[@class='inventory_list']/div[5]/div[2]/div[1]/div[1]
${txt_redTshirt_desc}    //div[@class='inventory_list']/div[6]/div[2]/div[1]/div[1]

# Products Price
${txt_backpack_price}    //div[@class='inventory_list']//div[1]//div[2]//div[2]//div[1]
${txt_bikeLight_price}    //div[@class='inventory_list']//div[2]//div[2]//div[2]//div[1]
${txt_boltTshirt_price}    //div[@class='inventory_list']//div[3]//div[2]//div[2]//div[1]
${txt_fleeceJacket_price}    //div[@class='inventory_list']//div[4]//div[2]//div[2]//div[1]
${txt_onesie_price}    //div[@class='inventory_list']//div[5]//div[2]//div[2]//div[1]
${txt_redTshirt_price}    //div[@class='inventory_list']//div[6]//div[2]//div[2]//div[1]

# Product Add to Cart Button
${btn_backpack_addToCart}    //button[@id='add-to-cart-sauce-labs-backpack']
${btn_bikeLight_addToCart}    //button[@id='add-to-cart-sauce-labs-bike-light']
${btn_boltTshirt_addToCart}    //button[@id='add-to-cart-sauce-labs-bolt-t-shirt']
${btn_fleeceJacket_addToCart}    //button[@id='add-to-cart-sauce-labs-fleece-jacket']
${btn_onesie_addToCart}    //button[@id='add-to-cart-sauce-labs-onesie']
${btn_redTshirt_addToCart}    //button[@id='add-to-cart-test.allthethings()-t-shirt-(red)']

# Social Media
${btn_twitter}    //a[normalize-space()='Twitter']
${btn_facebook}    //a[normalize-space()='Facebook']
${btn_linkedin}    //a[normalize-space()='LinkedIn']
# ====================================================================================================




# ====================================================================================================
*** Keywords ***
App Page Setup
    ${current_url}    Get Location
    IF    $productList_sub_url in $current_url
        Reload Page
    ELSE
        Login Setup
        Login As Standard User
    END
    
Create Product's ${element} List
    ${converted}    Convert To Lower Case    ${element}
    IF     "title" in $converted
        @{products}    Create List    ${txt_backpack_title}    ${txt_bikeLight_title}    ${txt_boltTshirt_title}
        ...    ${txt_fleeceJacket_title}    ${txt_onesie_title}    ${txt_redTshirt_title}
    ELSE IF    "desc" in $converted
        @{products}    Create List    ${txt_backpack_desc}    ${txt_bikeLight_desc}    ${txt_boltTshirt_desc}
        ...    ${txt_fleeceJacket_desc}    ${txt_onesie_desc}    ${txt_redTshirt_desc}
    ELSE IF    "price" in $converted
        @{products}    Create List    ${txt_backpack_price}    ${txt_bikeLight_price}    ${txt_boltTshirt_price}
        ...    ${txt_fleeceJacket_price}    ${txt_onesie_price}    ${txt_redTshirt_price}
    END
    RETURN    @{products}

Get Current Product's ${type} Sequence
    @{prod_seq}    Create List    ${EMPTY}
    ${converted}    Convert To Lower Case    ${type}
    IF    "name" in $converted
        @{products}    Create Product's Title List
    ELSE IF    "price" in $converted
        @{products}    Create Product's Price List
    END
    FOR    ${product}    IN    @{products}
        IF    $products.index($product) == 0
            ${value}    SeleniumLibrary.Get Element Attribute    ${product}    textContent
            Set List Value    ${prod_seq}    0    ${value}
        ELSE
            ${value}    SeleniumLibrary.Get Element Attribute    ${product}    textContent
            Append To List    ${prod_seq}    ${value}
        END
    END
    RETURN    @{prod_seq}

Sort Product By Name, A-Z
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${drd_sortProduct}
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${opt_name_az}
    ${active_sort}    SeleniumLibrary.Get Element Attribute    ${txt_activeSort}    textContent
    Run Keyword And Continue On Failure    Should Be Equal    ${active_sort}    Name (A to Z)

Sort Product By Name, Z-A
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${drd_sortProduct}
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${opt_name_za}
    ${active_sort}    SeleniumLibrary.Get Element Attribute    ${txt_activeSort}    textContent
    Run Keyword And Continue On Failure    Should Be Equal    ${active_sort}    Name (Z to A)

Sort Product By Price, Low-High
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${drd_sortProduct}
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${opt_price_lohi}
    ${active_sort}    SeleniumLibrary.Get Element Attribute    ${txt_activeSort}    textContent
    Run Keyword And Continue On Failure    Should Be Equal    ${active_sort}    Price (low to high)

Sort Product By Price, High-Low
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${drd_sortProduct}
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${opt_price_hilo}
    ${active_sort}    SeleniumLibrary.Get Element Attribute    ${txt_activeSort}    textContent
    Run Keyword And Continue On Failure    Should Be Equal    ${active_sort}    Price (high to low)

Get Product Sequence Before Sorting
    ${type}    Set Variable    ${EMPTY}
    ${converted}    Convert To Lower Case    ${TEST_NAME}
    IF    "name" in $converted
        ${type}    Set Variable    Name
    ELSE IF    "price" in $converted
        ${type}    Set Variable    Price
    END
    @{sequence}    Get Current Product's ${type} Sequence
    Set Global Variable    @{CURRENT_SEQUENCE}    @{sequence}

Get Product Sequence After Sorting
    ${type}    Set Variable    ${EMPTY}
    ${converted}    Convert To Lower Case    ${TEST_NAME}
    IF    "name" in $converted
        ${type}    Set Variable    Name
    ELSE IF    "price" in $converted
        ${type}    Set Variable    Price
    END
    @{sequence}    Get Current Product's ${type} Sequence
    Set Global Variable    @{AFTER_SEQUENCE}    @{sequence}

Verify Success: Products Sorted
    @{reversed}    Revert List    ${CURRENT_SEQUENCE}
    FOR    ${index}    ${product}    IN ENUMERATE    @{AFTER_SEQUENCE}
        IF    $reversed[$index] != $product
            Fail    Sorting is not succeed.            
        END
    END
# ====================================================================================================