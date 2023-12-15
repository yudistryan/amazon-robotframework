# ====================================================================================================
*** Settings ***
Resource    general.resource
# ====================================================================================================



# ====================================================================================================
*** Variables ***
# Page Unique Elements
${unq_appPage}    //span[@class='title'][contains(.,'Products')]

# Shopping Cart
${btn_cartTop}    //a[@class='shopping_cart_link']
${img_cartBadge}    //span[@class='shopping_cart_badge']

# Sidebar Menu
${btn_burger_sidebar}    id:react-burger-menu-btn
${img_burger_icon}    //img[@alt='Open Menu']
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

# Product Remove from Cart Button
${btn_wildcard_removeFromCart}    //button[contains(@id,'remove')]
${btn_backpack_removeFromCart}    //button[@id='remove-sauce-labs-backpack']
${btn_bikeLight_removeFromCart}    //button[@id='remove-sauce-labs-bike-light']
${btn_boltTshirt_removeFromCart}    //button[@id='remove-sauce-labs-bolt-t-shirt']
${btn_fleeceJacket_removeFromCart}    //button[@id='remove-sauce-labs-fleece-jacket']
${btn_onesie_removeFromCart}    //button[@id='remove-sauce-labs-onesie']
${btn_redTshirt_removeFromCart}    //button[@id='remove-test.allthethings()-t-shirt-(red)']

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

Open Sidebar
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_burger_sidebar}
    Wait Until Element Is Visible    ${btn_about_sidebar}

Click on All Items Button in Sidebar
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_allItems_sidebar}

Click on About Button in Sidebar
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_about_sidebar}

Click on Logout Button in Sidebar
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_logout_sidebar}

Click on Reset App State Button in Sidebar
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_resetAppState_sidebar}

Verify Success: User is Redirected to Sauce Lab Website
    ${current_url}    Get Location
    IF    $current_url not in $about_url
        Fail    User is not redirected correctly.
    END

Verify Success: Logged Out
    ${current_url}    Get Location
    IF    $current_url != $base_url
        Fail    User is not redirected correctly.
    END
    Run Keyword And Continue On Failure    Element Should Be Visible    ${unq_loginPage}

Click All Add to Cart Buttons
    ${buttons}    Create List    ${btn_backpack_addToCart}    ${btn_bikeLight_addToCart}    ${btn_boltTshirt_addToCart}
    ...    ${btn_fleeceJacket_addToCart}    ${btn_onesie_addToCart}    ${btn_redTshirt_addToCart}
    FOR    ${button}    IN    @{buttons}
        Wait Until Keyword Succeeds    10s    1s    Click Element    ${button}
    END
    Run Keyword And Continue On Failure    Element Should Be Visible    ${img_cartBadge}
    ${total_product}    SeleniumLibrary.Get Element Attribute    ${img_cartBadge}    textContent
    Run Keyword And Continue On Failure    Should Be Equal    ${total_product}    6

Click All Remove from Cart Buttons
    ${buttons}    Create List    ${btn_backpack_removeFromCart}    ${btn_bikeLight_removeFromCart}    ${btn_boltTshirt_removeFromCart}
    ...    ${btn_fleeceJacket_removeFromCart}    ${btn_onesie_removeFromCart}    ${btn_redTshirt_removeFromCart}
    FOR    ${button}    IN    @{buttons}
        Wait Until Keyword Succeeds    10s    1s    Click Element    ${button}
    END
    Run Keyword And Continue On Failure    Element Should Not Be Visible    ${img_cartBadge}

Click on Shopping Cart
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_cartTop}
    Wait Until Element Is Visible    ${unq_yourCartPage}

Verify Success: Badge is Disappeared
    Run Keyword And Continue On Failure    Element Should Not Be Visible    ${img_cartBadge}

Verify Success: Redirected to All Items Page
    Wait Until Element Is Visible    ${unq_appPage}    5s
    Verify Success: All Images are Relevant

Click on ${socmed} Icon
    ${socmed}    Convert To Lower Case    ${socmed}
    IF    $socmed == "twitter"
        Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_twitter}
    ELSE IF    $socmed == "facebook"
        Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_facebook}
    ELSE IF    $socmed == "linkedin"
        Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_linkedin}
    END

Verify Success: Redirected to Sauce Lab's ${socmed}
    ${urls}    Get Locations
    ${socmend}    Convert To Lower Case    ${socmed}
    IF    $socmed == "twitter"
        Run Keyword And Continue On Failure    Should Be Equal    ${twitter_url}    ${urls}
    ELSE IF    $socmed == "facebook"
        Run Keyword And Continue On Failure    Should Be Equal    ${facebook_url}    ${urls}
    ELSE IF    $socmed == "linkedin"
        Run Keyword And Continue On Failure    Should Be Equal    ${linkedin_url}    ${urls}
    END

Verify Success: Cart Badge is Updated
    ${element_count}    SeleniumLibrary.Get Element Count    ${btn_wildcard_removeFromCart}
    ${total_product}    SeleniumLibrary.Get Element Attribute    ${img_cartBadge}    textContent
    ${total_product}    Convert To Integer    ${total_product}
    Set Global Variable    ${TOTAL_PURCHASED_PRODUCT}    ${total_product}
    Run Keyword And Continue On Failure    Should Be Equal    ${total_product}    ${element_count}
    
Verify Success: All Products are Added to Cart
    ${names}    Get Products Name List
    ${prices}    Get Products Price List
    FOR    ${index}    IN RANGE    ${TOTAL_PURCHASED_PRODUCT}
        ${product_name}    SeleniumLibrary.Get Element Attribute    ${txt_first_name_cart}    textContent
        ${product_price}    SeleniumLibrary.Get Element Attribute    ${txt_first_price_cart}    textContent
        IF    $product_name not in $names and $product_price not in $prices
            Fail    Product is not matched with purchased product from previous page.
        END
    END
    Open Sidebar
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_resetAppState_sidebar}
# ====================================================================================================